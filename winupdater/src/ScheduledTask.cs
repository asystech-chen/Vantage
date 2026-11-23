using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Reflection;
using System.Text;

namespace Vantage.WinUpdater
{
    /// <summary>
    /// Registers the per-user update check task through the Task Scheduler COM
    /// API (no PowerShell scripts needed). Falls back to schtasks.exe.
    /// </summary>
    internal static class ScheduledTask
    {
        public const string Prefix = "Vantage WinUpdater";

        public static string CurrentTaskName
        {
            get { return Prefix + " (" + Native.ShortUserName() + ")"; }
        }

        public static bool Exists(string taskName)
        {
            try
            {
                object folder = Connect();
                object task = folder.GetType().InvokeMember(
                    "GetTask", BindingFlags.InvokeMethod, null, folder, new object[] { taskName });
                return task != null;
            }
            catch
            {
                return false;
            }
        }

        public static bool Create(string taskName, string exePath, out string error)
        {
            error = null;
            string xml = BuildXml(exePath);

            try
            {
                RegisterCom(taskName, xml);
                return true;
            }
            catch (Exception ex)
            {
                error = ex.Message;
            }

            if (RegisterSchtasks(taskName, xml, out error))
                return true;

            return false;
        }

        public static bool Remove(string taskName, out string error)
        {
            error = null;
            try
            {
                DeleteCom(taskName);
                return true;
            }
            catch (Exception ex)
            {
                error = ex.Message;
            }
            return RunSchtasks("/Delete /TN \"" + taskName + "\" /F", out error) == 0;
        }

        /// <summary>Removes every "Vantage WinUpdater*" task for the machine.</summary>
        public static int RemoveAll(out string error)
        {
            error = null;
            int removed = 0;

            // Exact per-user task first.
            string current = CurrentTaskName;
            try
            {
                DeleteCom(current);
                removed++;
            }
            catch
            {
            }

            // Remaining tasks (other accounts / stale names) via schtasks.
            foreach (string name in QueryTaskNames())
            {
                // schtasks may print root tasks as "\Name".
                string trimmed = name.TrimStart('\\');
                if (!trimmed.StartsWith(Prefix, StringComparison.OrdinalIgnoreCase))
                    continue;
                if (string.Equals(trimmed, current, StringComparison.OrdinalIgnoreCase))
                    continue;

                string deleteError;
                if (RunSchtasks("/Delete /TN \"" + trimmed + "\" /F", out deleteError) == 0)
                    removed++;
                else
                    error = deleteError;
            }

            return removed;
        }

        private static object Connect()
        {
            Type serviceType = Type.GetTypeFromProgID("Schedule.Service");
            if (serviceType == null)
                throw new InvalidOperationException("Task Scheduler is not available.");

            object service = Activator.CreateInstance(serviceType);
            service.GetType().InvokeMember("Connect", BindingFlags.InvokeMethod, null, service,
                new object[] { Type.Missing, Type.Missing, Type.Missing, Type.Missing });
            return service.GetType().InvokeMember("GetFolder", BindingFlags.InvokeMethod, null, service, new object[] { "\\" });
        }

        private static void RegisterCom(string taskName, string xml)
        {
            object folder = Connect();
            folder.GetType().InvokeMember(
                "RegisterTask",
                BindingFlags.InvokeMethod,
                null,
                folder,
                new object[] { taskName, xml, 6, Type.Missing, Type.Missing, 3, Type.Missing }); // TASK_CREATE_OR_UPDATE, INTERACTIVE_TOKEN
        }

        private static void DeleteCom(string taskName)
        {
            object folder = Connect();
            folder.GetType().InvokeMember(
                "DeleteTask",
                BindingFlags.InvokeMethod,
                null,
                folder,
                new object[] { taskName, 0 });
        }

        private static bool RegisterSchtasks(string taskName, string xml, out string error)
        {
            string file = Path.Combine(Native.TempDir, "vantage-task-" + Environment.TickCount + ".xml");
            try
            {
                File.WriteAllText(file, xml, Encoding.Unicode);
                int code = RunSchtasks("/Create /TN \"" + taskName + "\" /XML \"" + file + "\" /F", out error);
                return code == 0;
            }
            catch (Exception ex)
            {
                error = ex.Message;
                return false;
            }
            finally
            {
                Native.TryDelete(file);
            }
        }

        private static int RunSchtasks(string arguments, out string error)
        {
            error = null;
            try
            {
                var psi = new ProcessStartInfo("schtasks.exe", arguments)
                {
                    UseShellExecute = false,
                    CreateNoWindow = true,
                    RedirectStandardOutput = true,
                    RedirectStandardError = true
                };

                using (var process = Process.Start(psi))
                {
                    if (process == null)
                    {
                        error = "Could not start schtasks.exe.";
                        return -1;
                    }

                    string output = process.StandardOutput.ReadToEnd();
                    string stderr = process.StandardError.ReadToEnd();
                    process.WaitForExit();

                    if (process.ExitCode != 0)
                        error = string.IsNullOrEmpty(stderr) ? output.Trim() : stderr.Trim();

                    return process.ExitCode;
                }
            }
            catch (Exception ex)
            {
                error = ex.Message;
                return -1;
            }
        }

        private static IEnumerable<string> QueryTaskNames()
        {
            var names = new List<string>();
            try
            {
                var psi = new ProcessStartInfo("schtasks.exe", "/Query /FO CSV /NH")
                {
                    UseShellExecute = false,
                    CreateNoWindow = true,
                    RedirectStandardOutput = true,
                    RedirectStandardError = true
                };

                using (var process = Process.Start(psi))
                {
                    if (process == null)
                        return names;

                    string output = process.StandardOutput.ReadToEnd();
                    process.StandardError.ReadToEnd();
                    process.WaitForExit();

                    foreach (string line in output.Split(new[] { '\r', '\n' }, StringSplitOptions.RemoveEmptyEntries))
                    {
                        string name = FirstCsvField(line);
                        if (!string.IsNullOrEmpty(name))
                            names.Add(name);
                    }
                }
            }
            catch
            {
            }
            return names;
        }

        private static string FirstCsvField(string line)
        {
            if (string.IsNullOrEmpty(line))
                return null;
            if (line[0] != '"')
            {
                int comma = line.IndexOf(',');
                return comma < 0 ? line : line.Substring(0, comma);
            }

            var builder = new StringBuilder();
            for (int i = 1; i < line.Length; i++)
            {
                if (line[i] == '"')
                {
                    if (i + 1 < line.Length && line[i + 1] == '"')
                    {
                        builder.Append('"');
                        i++;
                        continue;
                    }
                    break;
                }
                builder.Append(line[i]);
            }
            return builder.ToString();
        }

        private static string BuildXml(string exePath)
        {
            string sid = Native.CurrentUserSid();
            string workingDir = Path.GetDirectoryName(exePath);
            string startBoundary = DateTime.Now.ToString("yyyy-MM-ddTHH:mm:ss");

            string logonUserId = string.IsNullOrEmpty(sid)
                ? string.Empty
                : "<UserId>" + Native.EscapeXml(sid) + "</UserId>";

            string principalUserId = string.IsNullOrEmpty(sid)
                ? string.Empty
                : "<UserId>" + Native.EscapeXml(sid) + "</UserId>";

            return "<?xml version=\"1.0\" encoding=\"UTF-16\"?>" + Environment.NewLine +
                "<Task version=\"1.2\" xmlns=\"http://schemas.microsoft.com/windows/2004/02/mit/task\">" + Environment.NewLine +
                "  <RegistrationInfo>" + Environment.NewLine +
                "    <Description>Vantage automatic update checks</Description>" + Environment.NewLine +
                "  </RegistrationInfo>" + Environment.NewLine +
                "  <Triggers>" + Environment.NewLine +
                "    <LogonTrigger>" + Environment.NewLine +
                "      <Enabled>true</Enabled>" + Environment.NewLine +
                "      " + logonUserId + Environment.NewLine +
                "      <Delay>PT1M</Delay>" + Environment.NewLine +
                "    </LogonTrigger>" + Environment.NewLine +
                "    <TimeTrigger>" + Environment.NewLine +
                "      <StartBoundary>" + startBoundary + "</StartBoundary>" + Environment.NewLine +
                "      <Enabled>true</Enabled>" + Environment.NewLine +
                "      <Repetition>" + Environment.NewLine +
                "        <Interval>PT4H</Interval>" + Environment.NewLine +
                "        <StopAtDurationEnd>false</StopAtDurationEnd>" + Environment.NewLine +
                "      </Repetition>" + Environment.NewLine +
                "    </TimeTrigger>" + Environment.NewLine +
                "  </Triggers>" + Environment.NewLine +
                "  <Principals>" + Environment.NewLine +
                "    <Principal id=\"Author\">" + Environment.NewLine +
                "      " + principalUserId + Environment.NewLine +
                "      <LogonType>InteractiveToken</LogonType>" + Environment.NewLine +
                "      <RunLevel>" + (Native.IsAdmin() ? "HighestAvailable" : "LeastPrivilege") + "</RunLevel>" + Environment.NewLine +
                "    </Principal>" + Environment.NewLine +
                "  </Principals>" + Environment.NewLine +
                "  <Settings>" + Environment.NewLine +
                "    <MultipleInstancesPolicy>IgnoreNew</MultipleInstancesPolicy>" + Environment.NewLine +
                "    <DisallowStartIfOnBatteries>false</DisallowStartIfOnBatteries>" + Environment.NewLine +
                "    <StopIfGoingOnBatteries>false</StopIfGoingOnBatteries>" + Environment.NewLine +
                "    <AllowHardTerminate>false</AllowHardTerminate>" + Environment.NewLine +
                "    <StartWhenAvailable>true</StartWhenAvailable>" + Environment.NewLine +
                "    <RunOnlyIfNetworkAvailable>true</RunOnlyIfNetworkAvailable>" + Environment.NewLine +
                "    <IdleSettings>" + Environment.NewLine +
                "      <StopOnIdleEnd>false</StopOnIdleEnd>" + Environment.NewLine +
                "      <RestartOnIdle>false</RestartOnIdle>" + Environment.NewLine +
                "    </IdleSettings>" + Environment.NewLine +
                "    <AllowStartOnDemand>true</AllowStartOnDemand>" + Environment.NewLine +
                "    <Enabled>true</Enabled>" + Environment.NewLine +
                "    <Hidden>false</Hidden>" + Environment.NewLine +
                "    <RunOnlyIfIdle>false</RunOnlyIfIdle>" + Environment.NewLine +
                "    <WakeToRun>false</WakeToRun>" + Environment.NewLine +
                "    <ExecutionTimeLimit>PT0S</ExecutionTimeLimit>" + Environment.NewLine +
                "    <Priority>7</Priority>" + Environment.NewLine +
                "  </Settings>" + Environment.NewLine +
                "  <Actions Context=\"Author\">" + Environment.NewLine +
                "    <Exec>" + Environment.NewLine +
                "      <Command>" + Native.EscapeXml(exePath) + "</Command>" + Environment.NewLine +
                "      <Arguments>/Scheduled</Arguments>" + Environment.NewLine +
                "      <WorkingDirectory>" + Native.EscapeXml(workingDir) + "</WorkingDirectory>" + Environment.NewLine +
                "    </Exec>" + Environment.NewLine +
                "  </Actions>" + Environment.NewLine +
                "</Task>";
        }
    }
}
