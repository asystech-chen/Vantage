using System;
using System.Drawing;
using System.Windows.Forms;

namespace Vantage.WinUpdater
{
    internal static class AppIcon
    {
        private static Icon _icon;

        public static Icon Get()
        {
            if (_icon != null)
                return _icon;

            try
            {
                _icon = Icon.ExtractAssociatedIcon(Application.ExecutablePath);
            }
            catch
            {
                _icon = null;
            }

            return _icon ?? SystemIcons.Application;
        }
    }

    /// <summary>
    /// Background tray icon. Hovering shows the current status in the tooltip,
    /// right-click offers "Check for updates" and "Exit".
    /// </summary>
    internal sealed class TrayApp : ApplicationContext
    {
        private readonly NotifyIcon _icon;
        private readonly ContextMenuStrip _menu;
        private readonly Action _onCheck;
        private bool _exiting;

        public TrayApp(bool visible, Action onCheck)
        {
            _onCheck = onCheck;

            _menu = new ContextMenuStrip();

            var checkItem = new ToolStripMenuItem("Check for updates");
            checkItem.Click += (sender, args) =>
            {
                if (_onCheck != null)
                    _onCheck();
            };

            var exitItem = new ToolStripMenuItem("Exit");
            exitItem.Click += (sender, args) => ExitApp();

            _menu.Items.Add(checkItem);
            _menu.Items.Add(new ToolStripSeparator());
            _menu.Items.Add(exitItem);

            _icon = new NotifyIcon
            {
                Icon = AppIcon.Get(),
                Text = "Vantage WinUpdater",
                Visible = visible,
                ContextMenuStrip = _menu
            };

            _icon.DoubleClick += (sender, args) =>
            {
                if (_onCheck != null)
                    _onCheck();
            };

            // Force the control handle so BeginInvoke works from worker threads.
            try { var handle = _menu.Handle; }
            catch { }
        }

        public void ShowIcon()
        {
            Post(() =>
            {
                try { _icon.Visible = true; }
                catch { }
            });
        }

        public void SetStatus(string status)
        {
            if (string.IsNullOrEmpty(status))
                return;

            Post(() =>
            {
                try { _icon.Text = Truncate(status, 60); }
                catch { }
            });
        }

        public void Notify(string title, string text, int timeoutMs)
        {
            Post(() =>
            {
                try
                {
                    _icon.Visible = true;
                    _icon.ShowBalloonTip(timeoutMs <= 0 ? 5000 : timeoutMs,
                        Truncate(title, 60), Truncate(text, 250), ToolTipIcon.Info);
                }
                catch { }
            });
        }

        public void ExitApp()
        {
            Post(DoExit);
        }

        private void DoExit()
        {
            if (_exiting)
                return;
            _exiting = true;

            try
            {
                _icon.Visible = false;
                _icon.Dispose();
                _menu.Dispose();
            }
            catch { }

            ExitThread();
        }

        private void Post(Action action)
        {
            try
            {
                if (_menu.IsHandleCreated)
                    _menu.BeginInvoke(action);
                else
                    action();
            }
            catch
            {
                try { action(); }
                catch { }
            }
        }

        internal static string Truncate(string text, int max)
        {
            if (string.IsNullOrEmpty(text))
                return string.Empty;
            return text.Length <= max ? text : text.Substring(0, max - 1) + "…";
        }
    }

    /// <summary>Shows a single balloon tip without keeping an icon around.</summary>
    internal sealed class BalloonContext : ApplicationContext
    {
        private readonly NotifyIcon _icon;
        private readonly Timer _timer;

        public BalloonContext(string title, string text, int timeoutMs)
        {
            _icon = new NotifyIcon
            {
                Icon = AppIcon.Get(),
                Text = "Vantage WinUpdater",
                Visible = true
            };
            _icon.ShowBalloonTip(timeoutMs, TrayApp.Truncate(title, 60), TrayApp.Truncate(text, 250), ToolTipIcon.Info);

            _timer = new Timer { Interval = timeoutMs + 1500 };
            _timer.Tick += (sender, args) =>
            {
                _timer.Stop();
                try
                {
                    _icon.Visible = false;
                    _icon.Dispose();
                }
                catch { }
                ExitThread();
            };
            _timer.Start();
        }
    }

    internal static class TemporaryBalloon
    {
        public static void Show(string title, string text, int timeoutMs = 5000)
        {
            try
            {
                Application.Run(new BalloonContext(title, text, timeoutMs));
            }
            catch
            {
                // Never let a notification failure break the updater.
            }
        }
    }
}
