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

librewolf-styling-description = Enable this if you want to customize the UI with a manually loaded theme.
librewolf-styling-warning1 = Make sure you trust the provider of the theme.

librewolf-xorigin-ref-description = Send a referrer only on same-origin.
librewolf-xorigin-ref-warning1 = This may cause breakage. Additionally, even when sent referrers will still be trimmed.

librewolf-webgl-description = WebGL is a strong fingerprinting vector.
librewolf-webgl-warning1 = If you need to enable it, consider using an extension like Canvas Blocker.

librewolf-rfp-description = ResistFingerprinting is the best in class anti-fingerprinting tool.
librewolf-rfp-warning1 = If you need to disable it, consider using an extension like Canvas Blocker.

librewolf-letterboxing-description = Letterboxing applies margins around your windows, in order to return a limited set of rounded resolutions.

librewolf-goog-safe-description = If you are worried about malware and phishing, consider enabling it.
librewolf-goog-safe-warning1 = Disabled over censorship concerns but recommended for less advanced users. All the checks happen locally.

librewolf-goog-safe-download-description = Allow Safe Browsing to scan your downloads to identify suspicious files.
librewolf-goog-safe-download-warning1 = All the checks happen locally.

# Footer
librewolf-footer = Useful linkss
librewolf-config-link = All advanced settings (about:config)
librewolf-open-profile = Open user profile directory
