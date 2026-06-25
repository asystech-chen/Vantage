session-restore-learn-more = What if it does not work?

## Vantage preferences

# Sidebar
pane-librewolf-title = Vantage
category-librewolf =
    .tooltiptext = about:config changes, logically grouped and easily accessible

# Main content
vantage-update-heading = Update
vantage-update-checkbox =
    .label = Automatically check for updates
vantage-theme-checkbox =
    .label = Enable Vantage Theme
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
librewolf-general-heading = Browser Behavior
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

librewolf-tabs-heading = Tab Behavior
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

librewolf-styling-description = When enabled: Customize the browser appearance (toolbar, tabs, etc.) via a userChrome.css file. Ideal for advanced users who want a personalized look.
librewolf-styling-warning1 = When disabled: Uses the default browser appearance. Only load CSS themes from trusted sources — malicious stylesheets could capture your input.

librewolf-xorigin-ref-description = When enabled: Only sends source page info when navigating within the same website. External sites won't know which page you came from.
librewolf-xorigin-ref-warning1 = When disabled: All websites can see which page you came from. Some websites that require referrer validation may break when this is enabled.

librewolf-webgl-description = When enabled: Websites can use WebGL for 3D graphics, but it may also be used to identify your device (fingerprinting).
librewolf-webgl-warning1 = When disabled: Better privacy, but websites using WebGL (3D maps, browser games) may not work correctly.

librewolf-rfp-description = When enabled: Hides browser characteristics (screen resolution, timezone, fonts, language, etc.), making you look identical to other users. Greatly enhances privacy.
librewolf-rfp-warning1 = When disabled: Your browser characteristics are fully exposed, making you easily trackable. Some websites rely on these for normal operation.

librewolf-letterboxing-description = When enabled: Window size is rounded to standard values, preventing websites from tracking you by your window dimensions. Black bars may appear on the sides.
librewolf-letterboxing-warning1 = When disabled: Websites can use your window size to help identify you. Requires ResistFingerprinting to be enabled first.

librewolf-goog-safe-description = If you are worried about malware and phishing, consider enabling it.
librewolf-goog-safe-warning1 = Disabled over censorship concerns but recommended for less advanced users. All the checks happen locally.

librewolf-goog-safe-download-description = Allow Safe Browsing to scan your downloads to identify suspicious files.
librewolf-goog-safe-download-warning1 = All the checks happen locally.

# Footer
librewolf-footer = Useful links
librewolf-config-link = All advanced settings (about:config)
librewolf-open-profile = Troubleshooting Information (about:support)

librewolf-debug = Debug Add-ons
vantage-privacy-dashboard-link = Privacy Dashboard

content-blocking-section-top-level-description = Vantage supports and enables Enhanced Tracking Protection in strict mode by default. This is one of the most important settings in the browser, as it provides state partitioning, strict blocklists, and other nuanced privacy features. We do not recommend changing to a different mode.
