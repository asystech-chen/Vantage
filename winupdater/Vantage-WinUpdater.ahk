; Vantage WinUpdater - Auto-updater for Vantage Browser on Windows
; Based on LibreWolf-WinUpdater by ltGuillaume (https://codeberg.org/ltguillaume)
; Adapted for Vantage Browser
; 逻辑严格对照上游 LibreWolf-WinUpdater v1.17.0（2026-08-04 对齐）
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

Global Args           := ""
      , Browser         := "Vantage"
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
      , IniFile, Path, Folder, ProgramW6432, WorkDir, Build
      , CurrentVersion, NewVersion, SetupFile, SetupFileHash, DownloadUrl, GuiHwnd, LogField, ProgField, VerField
      , TaskSetField, ShutdownBlocked, Died

; Strings
Global _Updater       := Browser " WinUpdater"
      , _Show           := "Show"
      , _Settings       := "Settings"
      , _Exit           := "Exit"
      , _NoConnectionError := "Could not connect to the internet."
      , _IsRunningError := _Updater " is already running."
      , _IsElevated     := "To set up scheduled tasks properly, please do not run WinUpdater as administrator."
      , _Checking       := "Checking for new version..."
      , _SetTask        := "Schedule automatic update checks while user {} is logged on."
      , _SettingTask    := (A_Args[1] = "/CreateTask" ? "Creating" : "Removing") " scheduled task..."
      , _Done           := " Done."
      , _GetPathError   := "Could not find the browser path.`nBrowse to {} in the following dialog."
      , _SelectFileTitle := _Updater " - Select " BrowserExe "..."
      , _WritePermError := "Could not write to {}. Please check write permissions for this folder."
      , _CopyError      := "Could not copy {}"
      , _GetVersionError := "Could not determine the current version of`n{}"
      , _GetBuildError  := "Could not determine the build type of " Browser "."
      , _DownloadJsonError := "Could not download the version info file."
      , _JsonVersionError := "Could not get version info from the server."
      , _FindUrlError   := "Could not find the download URL."
      , _Downloading    := "Downloading new version..."
      , _DownloadSetupError := "Could not download the setup file."
      , _Downloaded     := "New version downloaded."
      , _CheckingHash   := "Checking file integrity..."
      , _FindChecksumError := "Could not find the checksum for the downloaded file."
      , _ChecksumMatchError := "The file checksum for {} did not match, so it's possible the download failed."
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
	; 照上游：把 A_Args 拼成带引号的参数字符串（用于 Run 传递）
	; 注意：不能直接拼接 %A_Args%（数组对象无法转字符串）
	If (Scheduled Or RunningPortable)
		SetWorkingDir, %A_ScriptDir%
	Args := ""
	For i, Arg in A_Args
	{
		If (InStr(Arg, A_Space))
			Arg := """" Arg """"
		Args .= " " Arg
	}
}

CheckPaths() {
	; 1) WinUpdater 与浏览器同在安装目录（$INSTDIR\winupdater\ 的上级就是
	;    $INSTDIR\vantage.exe）；便携版同构（bin\vantage\winupdater\ 的上级
	;    就是 bin\vantage\vantage.exe）。这是最可靠的来源，优先使用。
	Path := A_ScriptDir "\..\" BrowserExe
	If (!FileExist(Path)) {
		; 2) ini 里保存的路径（用户手动选择过，照上游 IniRead/IniWrite）
		IniRead, Path, %IniFile%, Settings, Path, 0
		If (!Path) {
			; 3) 注册表 Uninstall 键：64 位视图（本程序是 32 位，避免 WOW64
			;    重定向到 Wow6432Node）
			SetRegView 64
			RegRead, InstallDir, HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall\Vantage, InstallLocation
			If (ErrorLevel Or !FileExist(InstallDir "\" BrowserExe))
				RegRead, InstallDir, HKCU\Software\Microsoft\Windows\CurrentVersion\Uninstall\Vantage, InstallLocation
			If (!ErrorLevel And FileExist(InstallDir "\" BrowserExe)) {
				Path := InstallDir "\" BrowserExe
			} Else {
				; 4) 枚举 Uninstall 子键：非默认目录安装的键带版本号
				;    （"Vantage 153.0.3 (x86_64 zh-CN)"），无法直查，只能枚举
				Path := ""
				Loop, Reg, HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall, K
				{
					RegRead, InstallDir, HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall\%A_LoopRegName%, InstallLocation
					If (!ErrorLevel And FileExist(InstallDir "\" BrowserExe)) {
						Path := InstallDir "\" BrowserExe
						Break
					}
				}
				If (Path = "") {
					Loop, Reg, HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall, K
					{
						RegRead, InstallDir, HKCU\Software\Microsoft\Windows\CurrentVersion\Uninstall\%A_LoopRegName%, InstallLocation
						If (!ErrorLevel And FileExist(InstallDir "\" BrowserExe)) {
							Path := InstallDir "\" BrowserExe
							Break
						}
					}
				}
			}
			SetRegView 32
			If (Path = "")
				Path := ProgramW6432 "\Vantage Browser\" BrowserExe
			Path := Trim(Path, """")	; FileExist chokes on double quotes
		}
	}

	; 照上游：上次更新中断时浏览器被移走（.wubak），启动时自动恢复
	If (FileExist(Path ".wubak")) {
		FileMove, %Path%.wubak, %Path%, 1
		If (ErrorLevel And !A_IsAdmin And !IsPortable)
			RunElevated()
	}

	If (!FileExist(Path)) {
		; 计划任务模式：静默失败并记日志，绝不弹窗（半夜弹窗很要命）
		If (Scheduled) {
			Die(_GetPathError, False, True)
			Return
		}
		; 交互模式：让用户手动选择，并记住选择（避免下次再弹）
		Progress(_GetPathError)
		Notify(_GetPathError)
		FileSelectFile, Path, 3, %ProgramW6432%\Vantage Browser, %_SelectFileTitle%, %BrowserExe%
		If (ErrorLevel Or !FileExist(Path))
			Exit()
		IniWrite, %Path%, %IniFile%, Settings, Path
	}
	SplitPath, Path,, Folder
}

GetCurrentVersion() {
	; 照上游：优先读版本资源的 ProductVersion 字符串（干净的两段/三段），
	; 失败时退回 FileGetVersion（读 FileVersion 字符串）。
	CurrentVersion := ""
	If (Sz := DllCall("Version\GetFileVersionInfoSizeW", "WStr", Path, "Int", 0))
		If (DllCall("Version\GetFileVersionInfoW", "WStr", Path, "Int", 0, "UInt", VarSetCapacity(V, Sz), "Str", V))
			If (DllCall("Version\VerQueryValueW", "Str", V, "WStr", "\StringFileInfo\000004B0\ProductVersion", "PtrP", pInfo, "Int", 0))
				CurrentVersion := StrGet(pInfo, "UTF-16")
	If (!CurrentVersion) {
		FileGetVersion, CurrentVersion, %Path%
		If (!CurrentVersion) {
			Progress(_GetVersionError "`n" Path, True)
			Die(StrReplace(_GetVersionError, "{}", Path))
		}
	}
	; Normalize: Windows 版本资源未设置的段为 65535 (0xFFFF)，尾部 .0 无意义。
	; "153.0.0.65535" → "153.0"；"152.0.6.0" → "152.0.6"
	CurrentVersion := RegExReplace(CurrentVersion, "(\.(0|65535))+$", "")
}

GetCurrentBuild() {
	; 照上游：读浏览器 exe 的 PE Machine 字段判断架构（x86_64 / i686 / arm64）
	Try {
		File := FileOpen(Path, "r")
		If (File) {
			File.Seek(0x3C, 0)	; MS-DOS header
			Offset := File.ReadUInt()
			File.Seek(Offset, 0)	; PE signature
			If (File.ReadUInt() = 0x4550) {	; "PE\0\0"
				File.Seek(Offset + 4, 0)	; Machine field from COFF header
				Machine := File.ReadUShort()
			}
			File.Close()
			Switch Machine {
				Case 0x8664:
					Return "x86_64"
				Case 0x014C:
					Return "i686"
				Case 0xAA64:
					Return "arm64"
			}
		}
		Die(_GetBuildError)
	} Catch e
		Die(_GetBuildError ": " e.Message)
}

CheckWriteAccess() {
	; 照上游 LibreWolf 设计：以 AppData 为家，副本单向流动，天然防循环。
	; - 自身不在浏览器目录（A_ScriptDir 下无 BrowserExe，如 AppData 副本）：
	;   ini 可写则留下；不可写则尝试去 AppData。
	; - 自身在安装目录（Program Files 等）：ini 通常不可写，复制三件套
	;   （自身 + 两个 ps1）到 AppData 后切换过去运行。
	; - 已在 AppData 且 ini 仍不可写：报错退出（防循环）。
	If (!FileExist(A_ScriptDir "\" BrowserExe)) {
		FileAppend,, %IniFile%
		If (!ErrorLevel) {
			SetWorkingDir, %WorkDir%
			Return
		}
	}

	AppData := A_AppData "\" Browser "\WinUpdater"
	If (IsPortable Or A_ScriptDir = AppData)
		Die(_WritePermError, A_ScriptDir)

	FileCreateDir, %AppData%
	If (ErrorLevel)
		Die(_WritePermError, AppData)

	Files := [ A_ScriptName, TaskCreateFile, TaskRemoveFile ]
	For Index, File in Files {
		If (!FileExist(AppData "\" File))
			FileCopy, %A_ScriptDir%\%File%, %AppData%
		If (ErrorLevel)
			Die(_CopyError, File " " _To "`n" AppData)
	}

	Run, %AppData%\%A_ScriptName% %Args%
	ExitApp
}

CheckConnection() {
	Connected := Download(VersionApiUrl)
	If (!Connected Or !InStr(Connected, """version"":")) {
		Die(_NoConnectionError,, !Scheduled)
	}
}

GetNewVersion() {
	Progress(_Checking)
	ReleaseInfo := Download(VersionApiUrl)
	If (!ReleaseInfo)
		Die(_DownloadJsonError)

	; Parse version from vd.json: "version": "153.0-3 正式版" / "152.0.6-1 正式版"
	; 注意：Vantage 版本号可能是两段（153.0-3）或三段（152.0.6-1），
	; 正则需同时支持：\d+.\d+(?:.\d+)*(?:-\d+)?
	RegExMatch(ReleaseInfo, "i)""version"":\s*""(\d+\.\d+(?:\.\d+)*(?:-\d+)?)", Release)
	NewVersion := Release1
	If (!NewVersion)
		Die(_JsonVersionError)

	; 按本机架构选下载 URL 和 sha256（vd.json 区分 windows_exe / win_arm64_exe）
	Build := GetCurrentBuild()
	If (Build = "arm64") {
		RegExMatch(ReleaseInfo, "i)""win_arm64_exe"":\s*""(.+?)""", ExeLink)
		RegExMatch(ReleaseInfo, "i)""win_arm64_exe_sha256"":\s*""([0-9a-fA-F]{64})""", ExeHash)
	} Else {
		RegExMatch(ReleaseInfo, "i)""windows_exe"":\s*""(.+?)""", ExeLink)
		RegExMatch(ReleaseInfo, "i)""windows_exe_sha256"":\s*""([0-9a-fA-F]{64})""", ExeHash)
	}
	DownloadUrl := ExeLink1
	SetupFileHash := ExeHash1
	If (!DownloadUrl)
		Die(_FindUrlError)
	If (!SetupFileHash)
		Die(_FindChecksumError)	; 服务器 vd.json 必须提供 sha256（照上游严格要求）

	IniRead, LastUpdateTo, %IniFile%, Log, LastUpdateTo, False
	; Vantage 的 release 号（153.0-3 的 -3）不在 exe 版本资源里，本地
	; CurrentVersion 永远是 "153.0"，任何带 release 的版本都比它大，会反复
	; 触发更新。用 LastUpdateTo 记住已安装版本，相等视为已是最新。
	If (!VerCompare(NewVersion, ">", CurrentVersion) Or NewVersion = LastUpdateTo) {
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

	; Download（若已有文件但哈希不匹配，删除重下——防残留坏文件）
	SetupFile := Browser "-" NewVersion ".exe"
	If (!FileExist(SetupFile) Or Hash(SetupFile) <> SetupFileHash) {
		FileDelete, %SetupFile%
		Progress(_Downloading)
		; WinINet UrlDownloadToFile 在 TLS 1.2+（Cloudflare）下手握失败，
		; 改用系统自带 curl.exe（Win10 1803+ 自带，Vantage 最低要求已排除 Win7）
		; -f：HTTP 4xx/5xx 直接失败退出，避免 404 页面被存成安装包
		ErrFile := A_Temp "\vantage-curl-err-" A_TickCount ".txt"
		RunWait, %ComSpec% /c curl.exe -L -sS -f --ssl-no-revoke --connect-timeout 30 --max-time 600 -o "%SetupFile%" "%DownloadUrl%" 2>"%ErrFile%", , Hide
		If (ErrorLevel Or !FileExist(SetupFile)) {
			FileRead, ErrMsg, %ErrFile%
			FileDelete, %ErrFile%
			Die(_DownloadSetupError "`n" DownloadUrl "`n" ErrMsg)
		}
		Progress(_CheckingHash)
		If (Hash(SetupFile) <> SetupFileHash)
			Die(_ChecksumMatchError, SetupFile)
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
		Log("LastUpdateTo", NewVersion)
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
				Log("LastUpdateTo", NewVersion)
				Log("LastResult", _IsUpdated)
				Progress(_IsUpdated, True)
				Done := True
			}
		}
	}
}

BrowserWaitClose() {
	; 照上游 main（1.18.2）：按浏览器可执行文件精确路径等待；
	; 用自定义 ProcessWaitClose（Sleep 轮询）而非内建 WaitClose，
	; 避免 Windows 11 高 CPU 占用（上游 8865519 修复）
	Notified := False
	BrowserWait:
	For Proc in ComObjGet("winmgmts:").ExecQuery("Select ProcessId from Win32_Process where ExecutablePath=""" StrReplace(Path, "\", "\\") """") {
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
	; 原 XMLHTTP（WinINet 栈）在部分网络环境（TLS 1.2 受限/代理异常）下
	; 同步请求会无限挂起（实测线上 vd.json 卡死、localhost 正常），
	; 改用 curl.exe（Win10 1803+ 自带）：TLS 1.2+ 原生支持，
	; --connect-timeout/--max-time 兜底，任何情况下都不会无限阻塞。
	Random, Num, 1, 1024
	JsonFile := A_Temp "\vantage-vd-" A_TickCount ".json"
	RunWait, %ComSpec% /c curl.exe -sS -f --ssl-no-revoke --connect-timeout 30 --max-time 60 -o "%JsonFile%" "%URL%?i=%Num%", , Hide
	If (ErrorLevel) {
		FileDelete, %JsonFile%
		Return False
	}
	FileRead, Content, %JsonFile%
	FileDelete, %JsonFile%
	Return Content
}

Hash(filePath, hashType = 4) {
	; 照上游 LibreWolf v1.18.2：SHA256 文件校验（vd.json 下载文件完整性检查）
	; https://www.autohotkey.com/board/topic/66139-ahk-l-calculating-md5sha-checksum-from-file/
	PROV_RSA_AES := 24
	CRYPT_VERIFYCONTEXT := 0xF0000000
	BUFF_SIZE := 1024 * 1024	; 1MB
	HP_HASHVAL := 0x0002
	HP_HASHSIZE := 0x0004

	HASH_ALG := hashType = 1 ? (CALG_MD2 := 32769) : HASH_ALG
	HASH_ALG := hashType = 2 ? (CALG_MD5 := 32771) : HASH_ALG
	HASH_ALG := hashType = 3 ? (CALG_SHA := 32772) : HASH_ALG
	HASH_ALG := hashType = 4 ? (CALG_SHA_256 := 32780) : HASH_ALG
	HASH_ALG := hashType = 5 ? (CALG_SHA_384 := 32781) : HASH_ALG
	HASH_ALG := hashType = 6 ? (CALG_SHA_512 := 32782) : HASH_ALG

	f := FileOpen(filePath, "r", "CP0")
	If (!IsObject(f))
		Return 0

	If (!hModule := DllCall("GetModuleHandleW", "Str", "Advapi32.dll", "Ptr"))
		hModule := DllCall("LoadLibraryW", "Str", "Advapi32.dll", "Ptr")

	If (!DllCall("Advapi32\CryptAcquireContextW"
			,"Ptr*", hCryptProv
			,"UInt", 0
			,"UInt", 0
			,"UInt", PROV_RSA_AES
			,"UInt", CRYPT_VERIFYCONTEXT))
		Goto, FreeHandles

	If (!DllCall("Advapi32\CryptCreateHash"
			, "Ptr",  hCryptProv
			, "UInt", HASH_ALG
			, "UInt", 0
			, "UInt", 0
			, "Ptr*", hHash))
		Goto, FreeHandles

	VarSetCapacity(read_buf, BUFF_SIZE, 0)
	hCryptHashData := DllCall("GetProcAddress", "Ptr", hModule, "AStr", "CryptHashData", "Ptr")

	While (cbCount := f.RawRead(read_buf, BUFF_SIZE)) {
		If (cbCount = 0)
			Break

		If (!DllCall(hCryptHashData
				, "Ptr",  hHash
				, "Ptr",  &read_buf
				, "UInt", cbCount
				, "UInt", 0))
			Goto, FreeHandles
	}

	If (!DllCall("Advapi32\CryptGetHashParam"
			, "Ptr",   hHash
			, "UInt",  HP_HASHSIZE
			, "UInt*", HashLen
			, "UInt*", HashLenSize := 4
			, "UInt",  0))
		Goto, FreeHandles

	VarSetCapacity(pbHash, HashLen, 0)
	If (!DllCall("Advapi32\CryptGetHashParam"
			, "Ptr",   hHash
			, "UInt",  HP_HASHVAL
			, "Ptr",   &pbHash
			, "UInt*", HashLen
			, "UInt",  0))
		Goto, FreeHandles

	SetFormat, Integer, Hex
	Loop, %HashLen%
	{
		num := NumGet(pbHash, A_Index - 1, "UChar")
		hashVal .= SubStr((num >> 4), 0) . substr((num & 0xf), 0)
	}
	SetFormat, Integer, D

FreeHandles:
	f.Close()
	DllCall("FreeLibrary", "Ptr", hModule)
	DllCall("Advapi32\CryptDestroyHash", "Ptr", hHash)
	DllCall("Advapi32\CryptReleaseContext", "Ptr", hCryptProv, "UInt", 0)

	Return hashVal
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

Log(Key, Value := "", Clear := False) {
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
	; 照上游：任务名带用户名（ScheduledTask-Create.ps1 注册为
	; "Vantage WinUpdater (用户名)"）
	RunWait, schtasks.exe /query /tn "%_Updater% (%A_UserName%)",, Hide
	GuiControl,, TaskSetField, % ErrorLevel = 0
	Gui, Submit, NoHide
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
		RunWait, powershell.exe -NoProfile -ExecutionPolicy RemoteSigned -File "%Script%",, Hide
	Sleep, 1000
	TaskCheck()

	If (SettingTask) {
		Progress(_SettingTask _Done, True)
		Sleep, 2000
		Exit()
	}
}

ThisUpdaterRunning() {
	; 照上游 main（1.18.2）：按自身可执行文件路径精确查重，
	; 并处理管理员/普通实例互认（提权进程的 ExecutablePath 普通权限读不到）
	CurrentProcess := DllCall("GetCurrentProcessId")
	Query := "Select ProcessId from Win32_Process where ProcessId!=" CurrentProcess " and ExecutablePath=""" StrReplace(A_ScriptFullPath, "\", "\\") """"

	Detect:
	For Process in ComObjGet("winmgmts:").ExecQuery(Query) {
		Sleep, 1000
		For Process in ComObjGet("winmgmts:").ExecQuery(Query)
			Return True
		Break
	}

	If (A_IsAdmin) {	; 让普通实例能感知到本提权实例在运行
		IniWrite, 1, %IniFile%, Log, RunningAsAdmin
		OnExit("AdminExit")
		Return False
	}

	IniRead, RunningAsAdmin, %IniFile%, Log, RunningAsAdmin, 0
	If (RunningAsAdmin) {
		Query := "Select ProcessId from Win32_Process where ProcessId!=" CurrentProcess	; 提权实例运行时扩大查询
		Goto, Detect
	}
}

AdminExit() {
	IniDelete, %IniFile%, Log, RunningAsAdmin
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
	If (Wait)
		GuiWaitClose()
}

GuiWaitClose() {
	ReleaseMem()
	WinWaitClose, ahk_id %GuiHwnd%
}

Focus() {
	Return !Scheduled And !RunningPortable And A_Args.Length() < 1
}

RunElevated() {
	; 照上游：UAC 提权重启（用于 .wubak 恢复等需要权限的操作）
	Try {
		Run *RunAs "%A_ScriptFullPath%" %Args% /Restart
	}
	ExitApp
}

Unelevate(Forced = False) {
	; 照上游：以管理员运行时降权重启（/Restart 标记防递归）
	If (!A_IsAdmin Or IsPortable Or (Scheduled And !Forced) Or RegExMatch(DllCall("GetCommandLine", "Str"), " /Restart(?!\S)"))
		Return
	If (RunUnelevated(A_ScriptFullPath, "/Restart " Args, A_ScriptDir))
		ExitApp
	Else
		Die(_IsElevated)
}

RunUnelevated(Prms*) {
	; ShellRun(Prms*) from AutoHotkey's Installer.ahk（照上游）
	Try {
		ShellWindows := ComObjCreate("Shell.Application").Windows
		VarSetCapacity(_Hwnd, 4, 0)
		Desktop := ShellWindows.FindWindowSW(0, "", 8, ComObj(0x4003, &_Hwnd), 1)
		If Ptlb := ComObjQuery(Desktop
				, "{4C96BE40-915C-11CF-99D3-00AA004AE837}"	; SID_STopLevelBrowser
				, "{000214E2-0000-0000-C000-000000000046}")	; IID_IShellBrowser
		{
				If DllCall(NumGet(NumGet(Ptlb + 0) + 15 * A_PtrSize), "Ptr", Ptlb, "Ptr*", Psv := 0) = 0
				{
						VarSetCapacity(IID_IDispatch, 16)
						NumPut(0x46000000000000C0, NumPut(0x20400, IID_IDispatch, "Int64"), "Int64")
						DllCall(NumGet(NumGet(psv+0)+15*A_PtrSize), "Ptr", Psv
							, "UInt", 0, "Ptr", &IID_IDispatch, "Ptr*", Pdisp := 0)
						Shell := ComObj(9, Pdisp, 1).Application
						Shell.ShellExecute(Prms*)
						ObjRelease(Psv)
				}
				ObjRelease(Ptlb)
		}
		Return True
	} Catch e
		Return False
}

Restart() {
	Return Exit(True)
}

Exit(Restart = False) {
	; 照上游：等待 GUI 关闭、清理临时文件与 .wubak、按需重启
	If (!Restart And !A_Args.Length() And WinExist("ahk_id " GuiHwnd))
		GuiWaitClose()
	Else
		Gui, Destroy

	Log("LastRun",, True)
	SetWorkingDir, %WorkDir%
	If (SetupFile And (InStr(Died, _DownloadSetupError) Or Done)) {
		Sleep, 2000
		FileDelete, %SetupFile%
	}
	If (FileExist(A_ScriptFullPath ".wubak") And !FileExist(A_ScriptFullPath))
		FileMove, %A_ScriptFullPath%.wubak, %A_ScriptFullPath%
	Else
		FileDelete, %A_ScriptFullPath%.wubak

	If (FileExist(Path ".wubak")) {
		If (FileExist(Path))
			FileDelete, %Path%.wubak
		Else
			FileMove, %Path%.wubak, %Path%
	}

	If (Restart)
		Run, % A_ScriptFullPath StrReplace(Args, "/Scheduled")
	ExitApp
}
