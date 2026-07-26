; Vantage WinUpdater - Auto-updater for Vantage Browser on Windows
; Based on LibreWolf-WinUpdater by ltGuillaume (https://codeberg.org/ltguillaume)
; Adapted for Vantage Browser
;@Ahk2Exe-SetFileVersion 1.0.0
;@Ahk2Exe-SetProductVersion 1.0.0

;@Ahk2Exe-Base Unicode 32*
;@Ahk2Exe-SetCompanyName ASYS Technology
;@Ahk2Exe-SetDescription Vantage WinUpdater
;@Ahk2Exe-SetMainIcon Vantage-WinUpdater.ico
;@Ahk2Exe-SetOrigFilename Vantage-WinUpdater.exe
;@Ahk2Exe-SetProductName Vantage WinUpdater

#NoEnv
#SingleInstance, Off

Global Browser         := "Vantage"
      , BrowserExe      := "vantage.exe"
      , BrowserPortable := "Vantage\" BrowserExe
      , VersionApiUrl   := "https://asystech.cn/vantage/vd.json"
      , ConnectCheckUrl := "https://asystech.cn/"
      , SetupParams     := "/D={}"
      , TaskCreateFile  := "ScheduledTask-Create.ps1"
      , TaskRemoveFile  := "ScheduledTask-Remove.ps1"
      , UpdaterFile     := Browser "-WinUpdater.exe"
      , PortableExe     := Browser "-Portable.exe"
      , IsPortable      := FileExist(A_ScriptDir "\" PortableExe)
      , RunningPortable := A_Args[1] = "/Portable"
      , Scheduled       := A_Args[1] = "/Scheduled"
      , SettingTask     := A_Args[1] = "/CreateTask" Or A_Args[1] = "/RemoveTask"
      , Done            := False
      , IniFile, Path, Folder, ProgramW6432, WorkDir
      , CurrentVersion, NewVersion, SetupFile, DownloadUrl, GuiHwnd, LogField, ProgField, VerField
      , TaskSetField, ShutdownBlocked, Died

; Strings
Global _Updater       := Browser " WinUpdater"
      , _Show           := "Show"
      , _Settings       := "Settings"
      , _Exit           := "Exit"
      , _NoConnectionError := "Could not connect to the internet."
      , _IsRunningError := _Updater " is already running."
      , _Checking       := "Checking for new version..."
      , _SetTask        := "Schedule automatic update checks while user {} is logged on."
      , _SettingTask    := (A_Args[1] = "/CreateTask" ? "Creating" : "Removing") " scheduled task..."
      , _Done           := " Done."
      , _GetPathError   := "Could not find the browser path.`nBrowse to {} in the following dialog."
      , _SelectFileTitle := _Updater " - Select " BrowserExe "..."
      , _WritePermError := "Could not write to {}. Please check write permissions for this folder."
      , _CopyError      := "Could not copy {}"
      , _GetVersionError := "Could not determine the current version of`n{}"
      , _DownloadJsonError := "Could not download the version info file."
      , _JsonVersionError := "Could not get version info from the server."
      , _FindUrlError   := "Could not find the download URL."
      , _Downloading    := "Downloading new version..."
      , _DownloadSetupError := "Could not download the setup file."
      , _Downloaded     := "New version downloaded."
      , _StartUpdate    := "  &Start update  "
      , _Installing     := "Installing new version..."
      , _UpdateError    := "Error while updating{}."
      , _SilentUpdateError := "Silent update did not complete.`nTry the interactive installer?"
      , _NewVersionFound := "New version available.`nClose " Browser " to continue..."
      , _NoNewVersion   := "No new version found."
      , _IsUpdated      := Browser " has been updated."
      , _To             := "to"

Init()
CheckArgs()
CheckPaths()
GetCurrentVersion()
If (ThisUpdaterRunning())
	Die(_IsRunningError,, !Scheduled)
Unelevate()
CheckWriteAccess()
If (SettingTask Or !A_Args.Length())
	GuiShow()
If (SettingTask)
	TaskSet()
CheckConnection()
If (GetNewVersion())
	GetUpdate()
Exit()

Init() {
	EnvGet, ProgramW6432, ProgramW6432
	If (ProgramW6432 = "")
		ProgramW6432 := "?"
	SplitPath, A_ScriptFullPath,,,, BaseName
	IniFile := A_ScriptDir "\" BaseName ".ini"
	IniRead, WorkDir, %IniFile%, Settings, WorkDir, %A_Temp%
	IniWrite, %WorkDir%, %IniFile%, Settings, WorkDir
	Menu, Tray, NoStandard
	Menu, Tray, Add, %_Show%, Action
	Menu, Tray, Add, %_Settings%, Action
	Menu, Tray, Add, %_Exit%, Action
	Menu, Tray, Default, %_Show%

	; GUI
	Gui, +HwndGuiHwnd -MaximizeBox
	Gui, Color, 1A1A2E
	Gui, Font, c0EA5A0 s18 w700, Segoe UI
	Gui, Add, Text, x12 y0 w330 h50 +0x200 BackgroundTrans Center, %Browser% WinUpdater
	Gui, Font, cAAAAAA s9 w700
	Gui, Add, Text, vVerField x12 y48 w330 BackgroundTrans Center
	Gui, Font, w400
	Gui, Add, Progress, vProgField x12 y+10 w330 h20 c0EA5A0, 10
	Gui, Add, Text, vLogField x12 y+10 w330
	Gui, Margin,, 15
	Gui, Show, Hide, %_Updater%

	If (SettingTask Or !A_Args.Length()) {
		If (!IsPortable And FileExist(A_ScriptDir "\" TaskCreateFile) And FileExist(A_ScriptDir "\" TaskRemoveFile)) {
			Gui, Add, CheckBox, vTaskSetField gTaskSet x15 y+10 w290 cAAAAAA Center Check3 -Tabstop, % StrReplace(_SetTask, "{}", A_UserName)
			TaskCheck()
		}
	}
}

Action(ItemName) {
	Switch ItemName
	{
		Case _Show:
			If (!WinExist("ahk_id " GuiHwnd))
				GuiShow()
			WinWait, ahk_id %GuiHwnd%
			WinActivate
			Return
		Case _Settings:
			Run, %IniFile%
			Return
		Case _Exit:
			If (Died Or Done)
				GuiClose()
			Else
				Gui, Show, AutoSize
			Return
	}
}

CheckArgs() {
	If (Scheduled Or RunningPortable)
		SetWorkingDir, %A_ScriptDir%
}

CheckPaths() {
	If (IsPortable) {
		Path := A_ScriptDir "\..\bin\" Browser "\" BrowserExe
		Folder := A_ScriptDir "\..\bin"
	} Else {
		; Try Program Files first, then registry
		Path := ProgramW6432 "\" Browser "\" BrowserExe
		If (!FileExist(Path)) {
			; Try HKCU uninstall key
			RegRead, InstallDir, HKCU\Software\Microsoft\Windows\CurrentVersion\Uninstall\%Browser%, InstallLocation
			If (ErrorLevel Or !FileExist(InstallDir "\" BrowserExe)) {
				; Try HKLM
				RegRead, InstallDir, HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall\%Browser%, InstallLocation
				If (!ErrorLevel And FileExist(InstallDir "\" BrowserExe))
					Path := InstallDir "\" BrowserExe
			} Else {
				Path := InstallDir "\" BrowserExe
			}
		}
		If (!FileExist(Path)) {
			Progress(_GetPathError)
			Notify(_GetPathError)
			FileSelectFile, Path, 3, %A_ProgramFiles%\%Browser%, %_SelectFileTitle%, %BrowserExe%
			If (ErrorLevel Or !FileExist(Path))
				Exit()
		}
		SplitPath, Path,, Folder
	}
}

GetCurrentVersion() {
	FileGetVersion, CurrentVersion, %Path%
	If (!CurrentVersion) {
		Progress(_GetVersionError "`n" Path, True)
		Die(StrReplace(_GetVersionError, "{}", Path))
	}
	; Normalize: e.g. "152.0.6.0" -> "152.0.6"
	CurrentVersion := RegExReplace(CurrentVersion, "(\.0)+$")
}

CheckWriteAccess() {
	; Test write permission to install folder
	Try {
		FileAppend,, %Folder%\write-test.tmp
		FileDelete, %Folder%\write-test.tmp
	} Catch {
		; No write access to install folder, try AppData
		SetWorkingDir, %A_AppData%\%Browser%\WinUpdater
		If (!InStr(A_ScriptFullPath, A_WorkingDir)) {
			FileCreateDir, %A_WorkingDir%
			FileCopy, %A_ScriptFullPath%, %A_WorkingDir%\%UpdaterFile%, 1
			If (ErrorLevel)
				Die(StrReplace(_CopyError, "{}", A_WorkingDir "\" UpdaterFile))
			Run, %A_WorkingDir%\%UpdaterFile% %A_Args%
			ExitApp
		}
	}
	SetWorkingDir, %WorkDir%
}

Unelevate() {
	; Don't run as admin - NSIS handles elevation during install
	If (A_IsAdmin) {
		Try {
			Run, *RunAs %A_ScriptFullPath% /RestartWithoutAdmin,,, PID
			ExitApp
		} Catch {
			; Continue as admin if we can't drop
		}
	}
}

CheckConnection() {
	Connected := Download(VersionApiUrl)
	If (!Connected Or !InStr(Connected, """windows_exe""")) {
		Die(_NoConnectionError,, !Scheduled)
	}
}

GetNewVersion() {
	Progress(_Checking)
	ReleaseInfo := Download(VersionApiUrl)
	If (!ReleaseInfo)
		Die(_DownloadJsonError)

	; Parse version from vd.json: "version": "152.0.6-1 正式版"
	RegExMatch(ReleaseInfo, "i)""version"":\s*""(\d+\.\d+\.\d+(?:-\d+)?)", Release)
	NewVersion := Release1
	If (!NewVersion)
		Die(_JsonVersionError)

	; Parse download URL
	RegExMatch(ReleaseInfo, "i)""windows_exe"":\s*""(.+?)""", ExeLink)
	DownloadUrl := ExeLink1
	If (!DownloadUrl)
		Die(_FindUrlError)

	IniRead, LastUpdateTo, %IniFile%, Log, LastUpdateTo, False
	If (!VerCompare(NewVersion, ">", CurrentVersion)) {
		Progress(_NoNewVersion, True)
		Log("LastResult", _NoNewVersion)
		Return False
	}
	Return NewVersion
}

GetUpdate() {
	GuiControl,, VerField, %CurrentVersion% %_To% %NewVersion%
	If (IsPortable Or !Scheduled)
		GuiShow()

	; Download
	SetupFile := Browser "-" NewVersion ".exe"
	If (!FileExist(SetupFile)) {
		Progress(_Downloading)
		UrlDownloadToFile, %DownloadUrl%, %SetupFile%
		If (ErrorLevel Or !FileExist(SetupFile))
			Die(_DownloadSetupError)
		Progress(_Downloaded)
	}

	; Wait for browser to close, then install
	BrowserWaitClose()
	Install()
}

Install() {
	BrowserWaitClose()
	PreventRunningWhileUpdating()
	Progress(_Installing)
	If (Scheduled)
		Notify(_Installing, CurrentVersion " " _To " v" NewVersion, 3000)
	SetupParams := StrReplace(SetupParams, "{}", Folder)

	; Silent install
	RunWait, %SetupFile% /S %SetupParams%,, UseErrorLevel
	If (!ErrorLevel) {
		Log("LastUpdate", NewVersion)
		Log("LastUpdateFrom", CurrentVersion)
		Log("LastResult", _IsUpdated)
		Progress(_IsUpdated, True)
		Notify(_IsUpdated, CurrentVersion " " _To " v" NewVersion, Scheduled And !ShutdownBlocked ? 60000 : 0)
		Done := True
	} Else {
		MsgBox, 52, %_Updater%, %_SilentUpdateError%
		IfMsgBox, No
			Die(StrReplace(_UpdateError, "{}"))
		Else {
			RunWait, %SetupFile% %SetupParams%,, UseErrorLevel
			If (ErrorLevel)
				Die(StrReplace(_UpdateError, "{}", " (" A_LastError ")"))
			Else {
				Log("LastUpdate", NewVersion)
				Log("LastResult", _IsUpdated)
				Progress(_IsUpdated, True)
				Done := True
			}
		}
	}
}

BrowserWaitClose() {
	Notified := False
	BrowserWait:
	For Proc in ComObjGet("winmgmts:").ExecQuery("Select ProcessId from Win32_Process where Name='" BrowserExe "'") {
		If (!Notified) {
			Progress(_NewVersionFound)
			Notify(_NewVersionFound)
			Notified := True
		}
		ProcessWaitClose(Proc.ProcessId)
		Goto, BrowserWait
	}
	Return Notified
}

ProcessWaitClose(ProcessId) {
	ReleaseMem()
	ProcessWait:
	Process, Exist, %ProcessId%
	If (ErrorLevel = ProcessId) {
		Sleep, 2000
		Goto, ProcessWait
	}
}

ReleaseMem() {
	Proc := DllCall("OpenProcess", "UInt", 0x001F0FFF, "Int", 0, "Int", DllCall("GetCurrentProcessId"))
	DllCall("SetProcessWorkingSetSize", "UInt", Proc, "Int", -1, "Int", -1)
	DllCall("CloseHandle", "Int", Proc)
}

PreventRunningWhileUpdating() {
	If (A_IsAdmin Or IsPortable)
		FileMove, %Path%, %Path%.wubak, 1
}


Download(URL) {
	Try {
		Random, Num, 1, 1024
		Object := ComObjCreate("Msxml2.XMLHTTP")
		Object.open("GET", URL "?i=" Num, false)
		Object.setRequestHeader("User-Agent", "WinUpdater")
		Object.send()
		If (Object.status = 200)
			Return Object.responseText
		Return False
	} Catch {
		Return False
	}
}

VerCompare(v1, op, v2) {
	; Convert "-" to "." so "152.0.6-1" → "152.0.6.1", then compare
	v1 := StrSplit(RegExReplace(StrReplace(v1, "-", "."), "[^\d.]", ""), ".")
	v2 := StrSplit(RegExReplace(StrReplace(v2, "-", "."), "[^\d.]", ""), ".")
	Loop, % Max(v1.Length(), v2.Length()) {
		n1 := v1[A_Index] ? v1[A_Index] : 0
		n2 := v2[A_Index] ? v2[A_Index] : 0
		If (n1 > n2)
			Return (op = ">")
		If (n1 < n2)
			Return (op = "<")
	}
	Return (op = "=" Or op = ">=" Or op = "<=")
}

Notify(Msg, SubMsg := "", Timeout := 0) {
	; Windows 10+ toast notification
	Try {
		If (SubMsg) {
			TrayTip, %_Updater% - %Msg%, %SubMsg%, %Timeout%
		} Else {
			TrayTip, %_Updater%, %Msg%, %Timeout%
		}
	}
}

Progress(Msg, Error := False) {
	GuiControl,, LogField, %Msg%
	If (Error) {
		GuiControl,, ProgField, 0
	} Else {
		Random, Pct, 10, 90
		GuiControl,, ProgField, %Pct%
	}
	If (Scheduled)
		Notify(_Updater, Msg, 3000)
}

Log(Key, Value, Clear := False) {
	; Skip logging for scheduled runs to avoid noise
	If (Scheduled And !Done)
		Return
	If (Clear) {
		IniDelete, %IniFile%, Log
		; Keep old settings
		IniRead, wd, %IniFile%, Settings, WorkDir
		FileDelete, %IniFile%
		IniWrite, % wd ? wd : A_Temp, %IniFile%, Settings, WorkDir
	}
	IniWrite, %Value%, %IniFile%, Log, %Key%
}

TaskCheck() {
	Try {
		RunWait, schtasks /query /tn "%_Updater%" /fo list, Hide, UseErrorLevel
		GuiControl,, TaskSetField, % (ErrorLevel ? 0 : 1)
	} Catch {
		GuiControl,, TaskSetField, 0
	}
}

TaskSet() {
	If (SettingTask) {
		Progress(_SettingTask)
		If (A_Args[1] = "/CreateTask")
			TaskSetField := 0
		Else If (A_Args[1] = "/RemoveTask")
			TaskSetField := 1
		Sleep, 1000
	}

	Script := A_ScriptDir "\" (TaskSetField = 0 ? TaskCreateFile : TaskRemoveFile)
	GuiControl,, TaskSetField, -1
	If (FileExist(Script))
		RunWait, powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%Script%",, Hide
	Sleep, 1000
	TaskCheck()

	If (SettingTask) {
		Progress(_SettingTask _Done, True)
		Sleep, 2000
		Exit()
	}
}

ThisUpdaterRunning() {
	Process, Exist
	ThisPID := ErrorLevel
	DetectHiddenWindows, On
	WinGet, List, List, %_Updater% ahk_class AutoHotkeyGUI
	Loop, %List% {
		WinGet, PID, PID, % "ahk_id " List%A_Index%
		If (PID <> ThisPID)
			Return True
	}
	Return False
}

Die(Msg, ShowHelp := True, ShowOnScheduled := True) {
	Died := Msg
	Log("LastResult", Msg)
	Notify(_Updater, Msg, Scheduled And ShowOnScheduled ? 20000 : 0)
	If (!Scheduled Or ShowOnScheduled) {
		Progress(Msg, True)
		If (ShowHelp)
			MsgBox, 48, %_Updater%, %Msg%
	}
	Exit()
}

GuiClose() {
	Try {
		Gui, Destroy
	} Catch {}
	Exit()
}

GuiEscape:
	If (Died Or Done)
		GuiClose()
Return

GuiShow(Wait = False) {
	NoFocus := WinExist("ahk_id " GuiHwnd) ? "NA" : "Minimize"
	Gui, Show, % "AutoSize " (Focus() ? "" : NoFocus)
	If (!Focus())
		Gui, Flash
}

Focus() {
	Return !Scheduled And !RunningPortable And A_Args.Length() < 1
}

Exit(Restart = False) {
	Process, Close, %A_ScriptFullPath%
	ExitApp
}
