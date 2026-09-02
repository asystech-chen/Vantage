session-restore-learn-more = What if it does not work?

## Vantage preferences

# Sidebar
pane-librewolf-title = Vantage
category-librewolf =
    .tooltiptext = about:config changes, logically grouped and easily accessible

# Main content
# About Vantage
vantage-about-heading = About Vantage
vantage-about-version = Version { $version }
vantage-about-update-checking = Checking for updates…
vantage-about-update-available = A new version is available — visit the official site to download
vantage-about-up-to-date = You are up to date

vantage-update-heading = Update
vantage-update-checkbox =
    .label = Automatically check for updates
vantage-theme-checkbox =
    .label = Enable Vantage Theme (requires browser restart)
vantage-theme-description = Writes the Vantage theme to your profile, adding rounded toolbars and tabs for a modern look. Requires a browser restart to take effect. Note: some third-party themes may override these visual styles — this only affects appearance, not browser functionality.

vantage-update-description = Check for new versions of Vantage on startup. You will be notified when a new version is available, but updates will not be installed automatically.

vantage-ai-heading = AI Sidebar
vantage-ai-checkbox =
    .label = Enable AI Sidebar
vantage-ai-description = Open AI chatbots in the sidebar. Supports DeepSeek, Qwen, Doubao, ChatGPT, Gemini, and Claude. Your conversations go directly to the provider — Vantage does not collect or process any data.

librewolf-header = Vantage Preferences
librewolf-warning-title = Heads up!
librewolf-warning-description = We carefully choose default settings to focus on privacy and security. When changing these settings, read the descriptions to understand the implications of those changes.

# Page Layout
librewolf-general-heading = Browser Behaviour
librewolf-extension-update-checkbox =
    .label = Update add-ons automatically
librewolf-sync-checkbox =
    .label = Enable Firefox Sync
librewolf-autocopy-checkbox =
    .label = Enable middle click paste
librewolf-styling-checkbox = 
    .label = Allow userChrome.css customization

librewolf-network-heading = Networking
librewolf-ipv6-checkbox =
    .label = Enable IPv6
vantage-doh-checkbox =
    .label = Enable DNS over HTTPS (DoH)
vantage-doh-description = When enabled: DNS queries are encrypted and resolved through AliDNS. Falls back to system DNS when DoH is unavailable, so intranet and VPN access keeps working.

librewolf-privacy-heading = Privacy
librewolf-webrtc-ip-checkbox =
    .label = Limit WebRTC local IP exposure
librewolf-webrtc-ip-description = Restrict WebRTC to use only the default network interface, preventing local IP address leaks.
librewolf-font-vis-checkbox =
    .label = Limit font visibility
librewolf-font-vis-description = Only expose base system fonts to websites, preventing font fingerprinting. Does not affect how fonts are rendered on pages.

librewolf-xorigin-ref-checkbox =
    .label = Limit cross-origin referrers

librewolf-broken-heading = Fingerprinting
librewolf-webgl-checkbox =
    .label = Enable WebGL
librewolf-rfp-checkbox =
    .label = Enable ResistFingerprinting
librewolf-letterboxing-checkbox =
    .label = Enable letterboxing

librewolf-security-heading = Security
librewolf-goog-safe-checkbox =
    .label = Enable Google Safe Browsing
librewolf-goog-safe-download-checkbox =
    .label = Scan downloads

# In-depth descriptions
librewolf-extension-update-description = Keep extensions up to date without manual intervention. A good choice for your security.
librewolf-extension-update-warning1 = If you don't review the code of your extensions before every update, you should enable this option.

librewolf-ipv6-description = Allow { -brand-short-name } to connect using IPv6.
librewolf-ipv6-warning1 = Instead of blocking IPv6 in the browser, we suggest enabling the IPv6 privacy extension in your OS.
librewolf-sync-description = Sync your data with other browsers. Requires restart.
librewolf-sync-warning1 = Firefox Sync encrypts data locally before transmitting it to the server.

librewolf-autocopy-description = Select some text to copy it, then paste it with a middle-mouse click.

librewolf-download-tmp-checkbox =
    .label = Save downloads to temporary directory
librewolf-download-tmp-description = When enabled: Downloaded files are saved to the system temporary directory and automatically cleaned up when the browser closes, preventing data traces.
librewolf-download-tmp-warning1 = When disabled: Files are saved directly to your download folder for easier access. Note that downloaded files may leave recoverable traces even after deletion.

# Download speedup
vantage-download-speed-heading = Download Speedup (Experimental)
vantage-download-mt-checkbox =
    .label = Enable multi-threaded downloads
vantage-download-mt-description = When enabled: Files from servers that support range requests are downloaded in parallel segments and merged, speeding up large downloads. Disable if downloads fail on certain websites.
vantage-download-maxparts-label = Maximum connections:
vantage-download-maxparts-warning = More than 8 connections may be rate-limited or blocked by some websites.
vantage-download-minsize-label = Minimum file size for multi-threading:
vantage-download-tmpdir-label = Part cache directory:
vantage-download-tmpdir-browse = Browse…
vantage-download-tmpdir-hint = Leave empty to use the system temporary directory. Choose a location with enough free space for large downloads.
vantage-download-tmpdir-picker-title = Choose part cache directory

librewolf-tabs-heading = Tab Behaviour
librewolf-tabs-scroll-checkbox =
    .label = Scroll to switch tabs
librewolf-tabs-dblclick-checkbox =
    .label = Double-click to close tab
librewolf-tabs-urlbar-checkbox =
    .label = Open address bar in new tab
librewolf-tabs-bookmarks-checkbox =
    .label = Open bookmarks in new tab
librewolf-tabs-search-checkbox =
    .label = Open search in new tab
librewolf-tabs-ctrlTab-checkbox =
    .label = Ctrl+Tab by recent use
librewolf-tabs-unload-checkbox =
    .label = Sleep inactive tabs under memory pressure

librewolf-styling-description = When enabled: Customize the browser appearance (toolbar, tabs, etc.) via a userChrome.css file. Ideal for advanced users who want a personalized look.
librewolf-styling-warning1 = When disabled: Uses the default browser appearance. Only load CSS themes from trusted sources — malicious stylesheets could capture your input.

librewolf-xorigin-ref-description = When enabled: Only sends source page info when navigating within the same website. External sites won't know which page you came from.
librewolf-xorigin-ref-warning1 = When disabled: All websites can see which page you came from. Some websites that require referrer validation may break when this is enabled.

librewolf-webgl-description = When enabled: Websites can use WebGL for 3D graphics, but it may also be used to identify your device (fingerprinting).
librewolf-webgl-warning1 = When disabled: Better privacy, but websites using WebGL (3D maps, browser games) may not work correctly.

librewolf-rfp-description = When enabled: Hides browser characteristics (screen resolution, time zone, fonts, language, etc.), making you look identical to other users. Greatly enhances privacy.
librewolf-rfp-warning1 = When disabled: Your browser characteristics are fully exposed, making you easily trackable. Some websites rely on these for normal operation.

librewolf-letterboxing-description = When enabled: Window size is rounded to standard values, preventing websites from tracking you by your window dimensions. Black bars may appear on the sides.
librewolf-letterboxing-warning1 = When disabled: Websites can use your window size to help identify you. Requires ResistFingerprinting to be enabled first.

librewolf-goog-safe-description = If you are worried about malware and phishing, consider enabling it.
librewolf-goog-safe-warning1 = Disabled over censorship concerns but recommended for less advanced users. All the checks happen locally.

librewolf-goog-safe-download-description = Allow Safe Browsing to scan your downloads to identify suspicious files.
librewolf-goog-safe-download-warning1 = All the checks happen locally.

librewolf-signatures-checkbox =
    .label = Require signed add-ons
librewolf-signatures-description = When enabled: Only add-ons signed by Mozilla can be installed, protecting you from potentially malicious extensions.
librewolf-signatures-warning1 = When disabled: Unsigned add-ons can be installed, which is useful for developers testing their own extensions. Exercise caution with add-ons from unknown sources.

librewolf-pdfjs-scripting-checkbox =
    .label = Allow JavaScript in PDF viewer
librewolf-pdfjs-scripting-description = When enabled: PDF files can execute JavaScript, enabling interactive forms and dynamic content. Some PDF forms require this to function correctly.
librewolf-pdfjs-scripting-warning1 = When disabled: JavaScript execution in PDF files is blocked, protecting you from PDF-based attacks. Most PDF documents will still display correctly.

# Footer
librewolf-footer = Useful links
librewolf-config-link = All advanced settings (about:config)
librewolf-open-profile = Troubleshooting Information (about:support)

librewolf-debug = Debug Add-ons
vantage-privacy-dashboard-link = Privacy Dashboard

content-blocking-section-top-level-description = Vantage supports and enables Enhanced Tracking Protection in strict mode by default. This is one of the most important settings in the browser, as it provides state partitioning, strict blocklists, and other nuanced privacy features. We do not recommend changing to a different mode.

vantage-nova-checkbox =
    .label = Enable Nova interface
vantage-nova-description = Nova is the new Firefox 153 appearance (rounded tabs, floating toolbar). When enabled, the Vantage theme switches to its Nova-adapted colours (blue-green gradient title bar). Takes effect immediately.

# Profile backup & restore
vantage-backup-heading = Profile Backup & Restore
vantage-backup-description = Export your profile (bookmarks, history, extensions, settings) as a ZIP archive, or restore from a backup. Restoring overwrites the current configuration and restarts the browser.
vantage-backup-export-button = Export Backup…
vantage-backup-export-title = Export Profile Backup
vantage-backup-export-success = Profile exported successfully.
vantage-backup-export-fail = Export failed: { $error }
vantage-backup-import-button = Restore from Backup…
vantage-backup-import-title = Restore Profile from Backup
vantage-backup-import-invalid = The selected file is not a valid Vantage profile backup.
vantage-backup-import-invalid-path = The backup contains illegal paths and was rejected.
vantage-backup-import-confirm-title = Restore Profile
vantage-backup-import-confirm = This will overwrite your current configuration (bookmarks, history, settings, extensions) and restart the browser. A backup of your current profile is created automatically. Continue?
vantage-backup-import-backup-fail = Failed to automatically back up the current profile: { $error }
vantage-backup-import-locked = Some files are locked and could not be replaced ({ $files }...). Please close the browser and restore again. Your previous profile backup is safe.
vantage-backup-import-done = Profile restored. The browser will restart now.

vantage-backup-export-confirm-title = Export Profile Backup
vantage-backup-export-confirm = The backup will contain sensitive data: cookies (website login sessions), browsing history, saved form data and website data. Login passwords are excluded for your safety. Please store the backup file securely and never share it. Continue?

vantage-download-resume-checkbox =
    .label = Resume interrupted downloads
vantage-download-resume-description = When enabled: if a download is interrupted before it finishes (for example, the browser is closed), clicking “Retry” continues it from where it left off instead of downloading the whole file again. Only applies when multi-connection download is enabled.

vantage-download-minsize-description = Files smaller than this size are downloaded with a single connection (splitting them would only make them slower). Larger files are split into multiple parts, up to the maximum connections set above.
