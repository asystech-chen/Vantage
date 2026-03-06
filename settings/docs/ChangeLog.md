This changelog will be used from now on to document changes in a precise manner, with a list of changes for each setting version.
Setting versions are documented using the pref `librewolf.cfg.version`, available in about:config.
# 8.5

* Explicitly disable weather feed in new tab page (ticket #2048)
* Handle google safebrowsing stuff, ticket #1879

# 8.4

Changes to librewolf.cfg:

DoH:

* Disable DoH by default. The short of it is that we can't decide for the user which DoH server is best to use.
* Provide much better default for when DoH is enabled. Mostly contributed by @Acideburn.

Other:

* [#69](https://codeberg.org/librewolf/settings/pulls/69) - DNS-over-HTTPS breaks IPv6 preference
* [#71](https://codeberg.org/librewolf/settings/pulls/71) - initial ML setup

To policies.json: 

* Remove the DNSoverHTTP stuff from there as per Acideburn's find. We now disable it more visibly from the config file instead.

# 8.3

* Enable DoH by default, this caused unanticipated problems.
* First version by @threadpanic, at Arkenfox v119, ships with LibreWolf v113.0-3.

# 8.2

- v7.10 was the last version by @fxbrit, at Arkenfox v119. This version ships with LibreWolf v113.0-1.

# 7.10

**base librewolf version**: 122.x

**References**:
- Disabled the new Fakespot shopping sidebar

#### Added preferences

```js
defaultPref("browser.shopping.experience2023.optedIn", 2);
defaultPref("browser.shopping.experience2023.active", false);
```

# 7.9

**base librewolf version**: 121.x

**References**:
- Added 4get.ca to the list of default search engines - https://codeberg.org/librewolf/issues/issues/1711
- Added default list of DoH providers containing Cloudflare and Quad9 - https://codeberg.org/librewolf/issues/issues/1683

#### Added preferences

```js
pref("doh-rollout.provider-list", '[{"UIName":"Mozilla Cloudflare","uri":"https://mozilla.cloudflare-dns.com/dns-query"},{"UIName":"Quad9","uri":"https://dns.quad9.net/dns-query"}]');
```

# 7.8


**base librewolf version**: 119.x - 120.x

#### Changed preferences

```diff
-lockPref("security.family_safety.mode", 0); // disable win8.1 family safety cert
+lockPref("security.family_safety.mode", 2); // Remove pre-Win10-specific codepath
``` 

#### Added preferences

```js
defaultPref("network.dns.skipTRR-when-parental-control-enabled", false);  // Arkenfox user.js v117
defaultPref("browser.search.separatePrivateDefault", true); // [FF70+] // Arkenfox user.js v119
defaultPref("browser.search.separatePrivateDefault.ui.enabled", true); // [FF71+]  // Arkenfox user.js v119
defaultPref("browser.urlbar.suggest.mdn", true);
defaultPref("browser.urlbar.addons.featureGate", false);
defaultPref("browser.urlbar.mdn.featureGate", false);
defaultPref("browser.urlbar.pocket.featureGate", false);
defaultPref("browser.urlbar.trending.featureGate", false);
defaultPref("browser.urlbar.weather.featureGate", false);
defaultPref("browser.download.start_downloads_in_tmp_dir", true); // Arkenfox user.js v118
defaultPref("browser.shopping.experience2023.enabled", false); // Arkenfox user.js v118
```

# 7.7

**base librewolf version**: 115.x - 118.x

**References**:
- https://gitlab.com/librewolf-community/settings/-/issues/262

#### Added preferences

```
defaultPref("browser.urlbar.suggest.weather", false);
defaultPref("extensions.quarantinedDomains.enabled", false);
```

# 7.6

**base librewolf version**: 111.x - 114.x

**References**:
- the prefs added in the `LOGGING` section are off by default in the official Mozilla builds, so we are just acting like Firefox here;

#### Removed preferences

```
defaultPref("browser.contentblocking.report.monitor.enabled", false); // default
```

#### Changed preferences

```
defaultPref("app.support.baseURL", "https://support.librewolf.net/");
```

#### Added preferences

```
pref("browser.dom.window.dump.enabled", false);
pref("devtools.console.stdout.chrome", false);
```

# 7.5

**target commit**: from 71a20c6fff90e7fbcb216f1d644ca1b40b32b8e2 to 6fe09c63cbfb83ebfb6a17f5e624248f2501b97e

**base librewolf version**: 109.x and 110.x

**References**:

- thumbnails are only used in privileged code to populate New Tab Page and Ctrl+Tab previews.
- the startup blank window doesn't break anything and the perceived performance boost is irrelevant on modern hardware.
- reset popup events to default as it's mostly a non-issue.

#### Removed preferences

```
defaultPref("browser.pagethumbnails.capturing_disabled", true);
defaultPref("browser.startup.blankWindow", false);
defaultPref("dom.popup_allowed_events", "click dblclick mousedown pointerdown");
```

# 7.4

**target commit**: b0d277a77b36e3bcc5c0f7a1b0eca7a54a388d9d

**base librewolf version**: 108.x

**References**:

- win7/8.x don't need this pref thanks to Firefox's own implementation of mDNS.

#### Removed preferences

```
defaultPref("media.peerconnection.ice.no_host", true); // don't use any private IPs for ICE candidate
```

# 7.3

**target commit**: from 9395f5c0e061250acbcbcb523d2270d57136d411 to 240e184b785e4e46c09ca6881111f7c2d4d31a3f

**base librewolf version**: 107.x

**References**:

- mixed content is already covered by HTTPS-only-mode;
- [dom.disable_beforeunload is no longer necessary](https://github.com/arkenfox/user.js/issues/1575);
- [beacon API is fine](https://gitlab.com/librewolf-community/settings/-/issues/229);
- [Firefox Vew pref was removed in previous commit](https://gitlab.com/librewolf-community/settings/-/commit/9395f5c0e061250acbcbcb523d2270d57136d411), adding reference to the changelog;

#### Removed preferences

```
defaultPref("security.mixed_content.block_display_content", true); // block insecure passive content
defaultPref("dom.disable_beforeunload", true);
defaultPref("dom.disable_open_during_load", true); // default
defaultPref("browser.tabs.firefox-view", false);
pref("beacon.enabled", false);
```

# 7.2

**target commit**: from 7211e954b82da3cde5c5cf2d613fe1f84288e635 to eb51b4785e5b67fc388bcbd06a8324d5a54f5850

**base librewolf version**: 106.x

**References**:

- hide Firefox View til reviewed, see https://gitlab.com/librewolf-community/browser/source/-/issues/78;
- hotfix for syntax error;

#### Removed preferences

```
defaultPref("browser.ssl_override_behavior", 1); // deprecated
```

#### Added preferences

```
defaultPref("browser.tabs.firefox-view", false);
```

# 7.1

**target commit**: 33e1ec1cb97d1f16a696057fe9007ae8391def6b

**base librewolf version**: 106.x

**References**:

- change most `lockPref()` to `pref()` or `defaultPref()`, see https://gitlab.com/librewolf-community/settings/-/issues/204;
- offline autodetection is mature enough and it is used by some APIs;
- if someone wants to get the mozilla extension for USB debugging, that's fine.

#### Removed preferences
```
defaultPref("network.manage-offline-status", false);
defaultPref("devtools.remote.adb.extensionURL", "");
defaultPref("devtools.chrome.enabled", false); // default
```

# 7.0

**target commit**: from ed9334d258d20830deafe1a02b87b0cea678236d to 1bdfd333e31c3d119c0bf5506a56b2026ead3583

**base librewolf version**: 105.x

**References**:

- [enable APS](https://github.com/arkenfox/user.js/issues/1530#issuecomment-1242850653);
- trim unnecessary or default NTP prefs, then tidy existing ones;
- stick to default session restore interval for writes;
- remove a bunch of default prefs that have been that way for the longest;
- offer accessibility by default;
- remove hardcore svg security pref since CVEs are very old and irrelevant, see [this discussion](https://github.com/arkenfox/user.js/issues/1529);
- improve [autoplay behavior](https://gitlab.com/librewolf-community/settings/-/issues/213).

#### Added preferences
```
defaultPref("privacy.partition.always_partition_third_party_non_cookie_storage", true);
defaultPref("privacy.partition.always_partition_third_party_non_cookie_storage.exempt_sessionstorage", false);
```

#### Removed preferences
```
defaultPref("browser.newtab.preload", false);
lockPref("browser.newtabpage.activity-stream.feeds.discoverystreamfeed", false);
lockPref("browser.newtabpage.activity-stream.discoverystream.enabled", false);
lockPref("browser.newtabpage.activity-stream.feeds.snippets", false); // default
lockPref("browser.newtabpage.activity-stream.feeds.system.topstories", false);
defaultPref("browser.sessionstore.interval", 60000); // increase time between session saves
defaultPref("network.http.windows-sso.enabled", false); // default
defaultPref("privacy.partition.serviceWorkers", true); // default v105+
defaultPref("accessibility.force_disabled", 1); // block accessibility services
lockPref("toolkit.telemetry.shutdownPingSender.enabledFirstSession", false); // default
lockPref("toolkit.telemetry.reportingpolicy.firstRun", false); // default
defaultPref("network.http.referer.XOriginPolicy", 0); // default
lockPref("browser.safebrowsing.passwords.enabled", false); // default
lockPref("browser.safebrowsing.provider.google4.dataSharing.enabled", false); // default
defaultPref("gfx.font_rendering.opentype_svg.enabled", false); // disale svg opentype fonts
defaultPref("media.autoplay.blocking_policy", 2);
```

# 6.9

**target commit**: 49a705f835e1438372fbdf1a779fbc5846212a68

**base librewolf version**: 104.x

**References**:
- autofill prefs have been replaced in a migration, we now only keep the bare minimum;

#### Removed preferences
```
defaultPref("browser.fixup.alternate.enabled", false); // default v104+
defaultPref("browser.urlbar.dnsResolveSingleWordsAfterSearch", 0); // default v104+
defaultPref("extensions.formautofill.available", "off"); // deprecated
defaultPref("extensions.formautofill.creditCards.available", false); // deprecated
defaultPref("extensions.formautofill.heuristics.enabled", false);
```

# 6.8

**target commit**: 381cbed42c98d2376faf7e4ec449623bb99b0be1

**base librewolf version**: 103.x

**References**:
- [geoclue](https://github.com/arkenfox/user.js/issues/1504);

#### Added preferences
```
defaultPref("geo.provider.use_geoclue", false); // [LINUX]
```

#### Removed preferences
```
defaultPref("network.cookie.cookieBehavior", 5); // default
```

# 6.7

**target commit**: from e505ddbf0242aec1017a565a74ff9ff5aa458fe5 to 02212c3f44e7aa68b22c8febd9158580d7e4b74f

**base librewolf version**: 103.x

**References**:
- the cookie lifetime policy pref has been deprecated, see https://gitlab.com/librewolf-community/settings/-/issues/199;
- stop disabling IPv6, see https://gitlab.com/librewolf-community/settings/-/issues/96;
- discussion about domain guessing is available at https://gitlab.com/librewolf-community/settings/-/issues/197.

#### Removed preferences
```
defaultPref("network.cookie.lifetimePolicy", 2); // deprecated
defaultPref("network.dns.disableIPv6", true);
```

#### Unlocked preferences
```
defaultPref("browser.fixup.alternate.enabled", false); // default v104+
```

# 6.6

**target commit**: from bc16f4f14185e8791d819a69b7d798082ace67f8 to c983fcc8bea8fab31265bc345217b59ce5128de2

**base librewolf version**: 102.x

**References**:
- sha1 certificates: https://bugzilla.mozilla.org/1767489 and https://bugzilla.mozilla.org/1766687.
- trimming only applies to http websites so it's very minimal.
- crlite: https://bugzilla.mozilla.org/show_bug.cgi?id=1773371, we can stick to default 3 till v103, then the value will be changed to 2 which is the best possible if mozilla feels like it's ready usability wise.
- add more entries to the native query stripping list, to [get in line with brave](https://github.com/brave/brave-core/blob/master/browser/net/brave_site_hacks_network_delegate_helper.cc).
- `services.settings.server` can now be used as a pref, see: https://gitlab.com/librewolf-community/browser/source/-/merge_requests/37

#### Added preferences
```
defaultPref("services.settings.server", "https://%.invalid") // set the remote settings URL (REMOTE_SETTINGS_SERVER_URL in the code)
```

#### Removed preferences
```
defaultPref("security.pki.sha1_enforcement_level", 1); // default
defaultPref("browser.urlbar.trimURLs", false);
defaultPref("security.pki.crlite_mode", 3); // default
defaultPref("security.OCSP.enabled", 1); // default
```

#### Changed preferences
```
defaultPref("privacy.query_stripping.strip_list", "__hsfp __hssc __hstc __s _hsenc _openstat dclid fbclid gbraid gclid hsCtaTracking igshid mc_eid ml_subscriber ml_subscriber_hash msclkid oft_c oft_ck oft_d oft_id oft_ids oft_k oft_lk oft_sk oly_anon_id oly_enc_id rb_clickid s_cid twclid vero_conv vero_id wbraid wickedid yclid");
```

# 6.5

**target commit**: b10dcbdd84e63787c4f2f6d34d41724b437df5be

**base librewolf version**: 101.x

**References**:
- query stripping is now [part of strict mode](https://hg.mozilla.org/mozilla-central/rev/9d9425eb1ded).
- session cookie prefs are useless given that we sanitize on close, [more details at arkenfox](https://github.com/arkenfox/user.js/pull/1443/commits/3207478033fefc19e933dab4eef6445125341ec4).
- fission has been a default for the longest now.

#### Removed preferences
```
defaultPref("privacy.query_stripping.enabled", true);
defaultPref("network.cookie.thirdparty.sessionOnly", true);
defaultPref("network.cookie.thirdparty.nonsecureSessionOnly", true);
defaultPref("fission.autostart", true);
```

# 6.4

**target commit**: eea09ca07333dc166213fa9c873e4916d979e97f

**base librewolf version**: 100.x

**References**:
- hide Firefox Focus promo in private tabs.
- double checking revoked certificates with both CRL and OCSP allows to detect false positives and it is also [the default](https://hg.mozilla.org/mozilla-central/rev/a6ba7b4ee17).
- [clearOnShutdown prefs now respect exceptions](https://github.com/arkenfox/user.js/issues/1441) so we can tick all boxes in that UI as well.

#### Added preferences
```
lockPref("browser.promo.focus.enabled", false);
defaultPref("privacy.clearOnShutdown.offlineApps", true);
```

#### Changed preferences
```
defaultPref("security.pki.crlite_mode", 3); // prev 2
```

#### Removed preferences
```
defaultPref("privacy.clearOnShutdown.cookies", false);
```

# 6.3

**target commit**: e84fc950bfd7c3542cb974e9d545b9b8e18c010d

**base librewolf version**: 99.x

**References**:
- Fixes the uBlock Origin installation URL

# 6.2

**target commit**: ac95f5195ed82ca6bcec48acf9d1241e3c683b25

**base librewolf version**: 99.x

**References**:
- vpn pref was set to the wrong value by mistake.
- offscreencanvas cannot be read back using JS, plus it is being tracked upstream. see [this comment](https://github.com/arkenfox/user.js/issues/1418#issuecomment-1093390017), which solves doubts from 6.1 changelog.

#### Removed preferences
```
defaultPref("gfx.offscreencanvas.domain-enabled", false);
```

#### Changed preferences
```
lockPref("browser.vpn_promo.enabled", false);
```

# 6.1

**target commit**: 465257e5993893cd7896ef1533d37e245f206fb9

**base librewolf version**: 99.x

**References**:
- csp pref has been deprecated.
- quicksuggest prefs are redundant as it has a master switch. the master switch is now force applied on each restart of the browser.
- do not whitelist offscreencanvas for now, we need to first check how it is tied to the "normal" canvas.

**Notes**: using the vpn pref should allow us to get rid of one patch.

#### Added preferences
```
lockPref("browser.vpn_promo.enabled", true);
defaultPref("gfx.offscreencanvas.domain-enabled", false);
```

#### Removed preferences
```
lockPref("security.csp.enable", true); // enforce csp, default
lockPref("browser.urlbar.suggest.quicksuggest.nonsponsored", false);
lockPref("browser.urlbar.suggest.quicksuggest.sponsored", false);
lockPref("browser.urlbar.quicksuggest.dataCollection.enabled", false); // default
lockPref("browser.urlbar.quicksuggest.scenario", "history");
```

#### Changed preferences
```
pref("browser.urlbar.quicksuggest.enabled", false);
```

# 6.0

**target commit**: 0822d491d2b377b5cd7f0429cee5aa916538fa50

**base librewolf version**: 98.x

**References**:
- we are going to force history to custom mode and hide the UI for always on PB mode, a bunch of pointers are collected in [this MR](https://gitlab.com/librewolf-community/browser/source/-/merge_requests/21).
- [handlers prefs are deprecated](https://bugzilla.mozilla.org/show_bug.cgi?id=1733497).
- for OCSP see [this issue](https://gitlab.com/librewolf-community/settings/-/issues/150).

#### Added preferences
```
pref("privacy.history.custom", true);
pref("browser.privatebrowsing.autostart", false);
defaultPref("browser.preferences.moreFromMozilla", false); // hide about:preferences#moreFromMozilla
defaultPref("security.OCSP.require", true); // set to hard-fail
```

#### Removed preferences
```
/** [SECTION] HANDLERS
 * remove the default handlers for several tipe of files and services.
 */
lockPref("gecko.handlerService.schemes.mailto.0.uriTemplate", "");
lockPref("gecko.handlerService.schemes.mailto.0.name", "");
lockPref("gecko.handlerService.schemes.mailto.1.uriTemplate", "");
lockPref("gecko.handlerService.schemes.mailto.1.name", "");
lockPref("gecko.handlerService.schemes.irc.0.uriTemplate", "");
lockPref("gecko.handlerService.schemes.irc.0.name", "");
lockPref("gecko.handlerService.schemes.ircs.0.uriTemplate", "");
lockPref("gecko.handlerService.schemes.ircs.0.name", "");
```

#### Changed preferences
```
defaultPref("security.OCSP.enabled", 1);
```

# 5.5

**target commit**: 0fc1ff53c99379d9d4625de65ea51287d57a0a3a

**base librewolf version**: 97.x

**References**:
- showing the insecure connection text is redundant as there's already the lock UI for http websites.
- `browser.places.speculativeConnect.enabled` controls speculative connections for bookmarks and will be fully effective only once we hit v98.
- we will no longer disable history but we'll clear it on close. [reasoning](https://gitlab.com/librewolf-community/settings/-/issues/135).
- [download annoyances](https://gitlab.com/librewolf-community/settings/-/issues/144).

**Notes**: the settings have been re-organized and they should also be documented a bit better now.

#### Removed preferences
```
defaultPref("security.insecure_connection_text.enabled", true); // display http websites as insecure in the ui
defaultPref("places.history.enabled", true);
```

#### Added preferences
```
defaultPref("browser.places.speculativeConnect.enabled", false);
defaultPref("browser.download.alwaysOpenPanel", false); // do not expand toolbar menu for every download, we already have enough interaction
```

#### Changed preferences
```
pref("security.tls.version.enable-deprecated", false); // make TLS downgrades session only by enforcing it with pref()
```

## 5.4

**target commit**:

**base librewolf version**: 96.x

**References**:
- [serve custom uBO assets](https://gitlab.com/librewolf-community/settings/-/issues/134)


#### Added preferences
```
defaultPref("librewolf.uBO.assetsBootstrapLocation", "https://gitlab.com/librewolf-community/browser/source/-/raw/main/assets/uBOAssets.json");
```

#### Changed preferences
```
defaultPref("privacy.query_stripping.strip_list", "__hsfp __hssc __hstc __s _hsenc _openstat dclid fbclid gbraid gclid hsCtaTracking igshid mc_eid ml_subscriber ml_subscriber_hash msclkid oly_anon_id oly_enc_id rb_clickid s_cid twclid vero_conv vero_id wbraid wickedid yclid");
```

## 5.3

**target commit**: c256656f377d3c15a8c7537c65f45dc802904df7

**base librewolf version**: 96.x

**References**:
- [disable sync differently](https://gitlab.com/librewolf-community/settings/-/issues/132);
- [remove tracking query params](https://gitlab.com/librewolf-community/settings/-/issues/128);


#### Added preferences
```
defaultPref("identity.fxaccounts.enabled", false); // sync and firefox account
defaultPref("privacy.query_stripping.enabled", true);
defaultPref("privacy.query_stripping.strip_list", "__hsfp __hssc __hstc __s _hsenc _openstat dclid fbclid gclid hsCtaTracking igshid mc_eid ml_subscriber ml_subscriber_hash msclkid oly_anon_id oly_enc_id rb_clickid s_cid vero_conv vero_id wickedid yclid");
```

## 5.2

**target commit**: f3b4414d30953d1ea3eb64a9d75c62c242ee991b

**base librewolf version**: 96.x

**References**:
- [fix console issue](https://gitlab.com/librewolf-community/settings/-/issues/129)

#### Added preferences
```
defaultPref("devtools.selfxss.count", 0);
```

## 5.1

**target commit**: f28b218e97acec8935c0c868863a9f4b6a061a39 and 60221803c46bf5cf2cbc5d77035927f9fd249e6a

**base librewolf version**: 96.x

**References**:
- [fix language issue](https://gitlab.com/librewolf-community/settings/-/issues/125)

#### Added preferences
```
pref("intl.accept_languages", "en-US, en");
```

#### Removed preferences
```
defaultPref("intl.locale.requested", "en-US");
defaultPref("privacy.spoof_english", 2);
defaultPref("browser.search.region", "US"); // set a default search region for all users
defaultPref("extensions.getAddons.langpacks.url", ""); // prevent users from adding lang packs, which would cause leaks
```

#### Changed preferences
```
pref("javascript.use_us_english_locale", true);
```

## 5.0

**target commit**: from 8a98176400e2e44ae1138ea8bdc1991250f75b8e to b219a75b4a0d72b519ce386406f45acead940c9a

**base librewolf version**: 96.x

**References**:
- [extension auto-updates](https://gitlab.com/librewolf-community/settings/-/issues/116)
- [remove all the OS specific prefs](https://gitlab.com/librewolf-community/settings/-/issues/124)
- [service workers and push](https://gitlab.com/librewolf-community/settings/-/issues/115)

#### Added preferences
```
defaultPref("privacy.partition.serviceWorkers", true); // isolate service workers
```

#### Removed preferences
```
defaultPref("extensions.update.enabled", false); // disable automatic checks for extension updates
defaultPref("extensions.update.autoUpdateDefault", false); // disable automatic installs of extension updates
defaultPref("browser.tabs.loadBookmarksInTabs", true);
defaultPref("clipboard.autocopy", false);
defaultPref("dom.popup_maximum", 4);
defaultPref("general.autoScroll", false);
defaultPref("devtools.selfxss.count", 0); // was set because of https://gitlab.com/librewolf-community/browser/linux/-/issues/80
defaultPref("dom.push.enabled", false); // disable push notifications
defaultPref("dom.push.serverURL", ""); // default "wss://push.services.mozilla.com/"
defaultPref("dom.serviceWorkers.enabled", false); // disable service workers, must enable for push notifications
```

## 4.0

**target commit**: 9003f029f8fe087cde5bb081d51ab82340948874

**base librewolf version**: 95.x

**References**:
- [review webrtc](https://gitlab.com/librewolf-community/settings/-/issues/108).
- [stop disabling geo api](https://gitlab.com/librewolf-community/settings/-/issues/102).
- [deprecate RFP dark mode](https://gitlab.com/librewolf-community/browser/common/-/issues/56).
- `offlineApps` change in 3.1 did not respect exceptions, so revert it.
- uncomment prefs to enable CRL without OCSP fallback, although they will fully work only when [this issue is closed](https://gitlab.com/librewolf-community/browser/common/-/issues/57).
- we decided to force a larger new window size by default, to improve usability for RFP users while still keeping a rounded value. see [this comment](https://gitlab.com/librewolf-community/settings/-/issues/104#note_752186737).

#### Added preferences
```
defaultPref("privacy.window.maxInnerWidth", 1600);
defaultPref("privacy.window.maxInnerHeight", 900);
```

#### Removed preferences
```
defaultPref("media.peerconnection.enabled", false);
lockPref("privacy.override_rfp_for_color_scheme", false);
defaultPref("geo.enabled", false);
defaultPref("permissions.default.geo", 2);
defaultPref("privacy.clearOnShutdown.offlineApps", true);
defaultPref("privacy.cpd.offlineApps", true);
```

#### Changed preferences
```
defaultPref("security.remote_settings.crlite_filters.enabled", true);
defaultPref("security.pki.crlite_mode", 2);
```

## 3.2

**target commit**: 19e59813ed483de7ffc8a219da96eb18a942eb01

**base librewolf version**: 94.x

**References**:
- block the new firefox suggests feature in full.
- enforce a sane value for manual sanitizing.

**Notes**: the suggest prefs might be overkill, we should try to trim to the bare minimum in the next release.

#### Added preferences
```
lockPref("browser.urlbar.quicksuggest.enabled", false); // disable suggest and hide its ui
lockPref("browser.urlbar.suggest.quicksuggest.nonsponsored", false); // disable suggestions from firefox
lockPref("browser.urlbar.suggest.quicksuggest.sponsored", false); // disable sponsored suggestions
lockPref("browser.urlbar.quicksuggest.dataCollection.enabled", false); // default
defaultPref("privacy.sanitize.timeSpan", 0);
```
#### Changed preferences
```
lockPref("browser.urlbar.quicksuggest.scenario", "history"); // prevent opt-in, doesn't work alone
```

## 3.1

**target commit**: 6844d4ad1c9ad8bb3ffdc29e0a607c21c0559da4 and 67e6a00b719ecd52782a724cd09a9f08fa4577c0

**base librewolf version**: 94.x

**References**:
- the added prefs are all defense in depth.
- `drawInTitlebar` was causing errors for some users, the bug was reproduced. Linux users might experience a different toolbar behavior because of this change.
- the default value for scopes seems like a better choice than changing it.
- `offlineApps` can be safely cleared without using logins, in fact it was most likely cleared by other sanitazion techniques regardless.

**Notes**: please notify users about the new website, thanks to @maltejur for helping with the migration.

#### Added preferences
```
defaultPref("webchannel.allowObject.urlWhitelist", ""); // remove webchannel whitelist
lockPref("toolkit.telemetry.coverage.opt-out", true); // hidden
defaultPref("privacy.cpd.offlineApps", true); // for consistency with clearOnShutdown prefs
```

#### Removed preferences
```
defaultPref("extensions.autoDisableScopes", 11); // bring back to default
defaultPref("browser.tabs.drawInTitlebar", true); // bring back to default
```

#### Changed preferences
```
defaultPref("privacy.clearOnShutdown.offlineApps", true); // can be cleared
defaultPref("app.support.baseURL", "https://librewolf.net/docs/faq/#");
defaultPref("browser.search.searchEnginesURL", "https://librewolf.net/docs/faq/#how-do-i-add-a-search-engine");
defaultPref("browser.geolocation.warning.infoURL", "https://librewolf.net/docs/faq/#how-do-i-enable-location-aware-browsing");
defaultPref("app.feedback.baseURL", "https://librewolf.net/#questions");
```

## 3.0

**target commit**: f0a2d5d70657cc87348282d6faaf72edff8bf304 and 4e0895a299ec99066f119d8ce1a2923fc91aa465

**base librewolf version**: 94.x

**References**:
- as reported in #95 and discussed [here](https://gitlab.com/librewolf-community/browser/linux/-/issues/246) we are re-enabling TP by default, setting it to strict.
- the sponsored shortcuts in about:preferences#home were already locked, now they are properly hidden.
- enable fission as it is being [rolled out to stable](https://bugzilla.mozilla.org/show_bug.cgi?id=1732206).

**Notes**: all the removed preferences were either related to disabling TP, or unecessary when using strict mode. as a result of this trimming the tracking protection section of the .cfg file doesn't need to exist anymore.

#### Added preferences
```
defaultPref("browser.topsites.useRemoteSetting", false); // hide sponsored shortcuts button from about:preferences#home
defaultPref("privacy.resistFingerprinting.letterboxing", false); // expose hidden letterboxing pref, but do not enable by default
defaultPref("fission.autostart", true); // enable fission by default
```

#### Removed preferences
```
lockPref("privacy.trackingprotection.enabled", false);
lockPref("privacy.trackingprotection.pbmode.enabled", false);
lockPref("privacy.trackingprotection.annotate_channels", false);
defaultPref("browser.safebrowsing.provider.mozilla.updateURL", "");
defaultPref("browser.safebrowsing.provider.mozilla.gethashURL", "");
defaultPref("privacy.trackingprotection.cryptomining.enabled", false);
defaultPref("privacy.trackingprotection.fingerprinting.enabled", false);
defaultPref("browser.contentblocking.cryptomining.preferences.ui.enabled", false);
defaultPref("browser.contentblocking.fingerprinting.preferences.ui.enabled", false);
```

#### Changed preferences
```
pref("browser.contentblocking.category", "strict");
```

## 2.0

**target commit**: from 6451faa167568313e5ed065fcb3ee2bb76132063 to b17a1ed657e22ac61b4399699223d36724b842e7

**base librewolf version**: 92.x

**References**:
- [web content can no longer access the battery api](https://bugzilla.mozilla.org/show_bug.cgi?id=1313580).
- http alternative services are [isolated by network partitioning and FPI](https://github.com/arkenfox/user.js/blob/269cf965bd51022ca69823f8f66a8e402280d856/user.js#L1350) and they are unchanged even in tor browser. from a security standpoint, the alternate service will need to provide the certificate of the origin in order to be considered trusthworthy.
- let the user decide what to manually clear, including the timespan.
- drm prefs have been trimmed as a quality of life improvement. the end result is the same, with less hassle for users who want to access drm-protected content.
- DNT header has been proved to not work and it is used to fingerprint.
- VR access is behind a prompt and, despite being unlikely, it could be fingerprinted. with all this on the table it's just not worth and overkill.
- vibrator API is so nieche that even tor does not change it. best to trim where possible.
- `extensions.getAddons.link.url"` is showed only when no extension is installed and it's not a bad suggestion to get addons from addons.mozilla.org so we can remove it.
- `browser.safebrowsing.downloads.remote.*` are all controlled by the prefs already in the .cfg, which is the same approach taken by tor browser.
- graphite [is no longer as concerning](https://cve.mitre.org/cgi-bin/cvekey.cgi?keyword=firefox+graphite) and blocking it is likely fingerprintable.
- the pdf prefs and the bookmark backup are not really relevant to librewolf.
- as reported [here](https://bugzilla.mozilla.org/show_bug.cgi?id=1606624) the shared memory pref is no longer needed, so we can switch it back to default.
- new tab page section now includes a new design and no longer an empty page. all the unnecessary preferences have been removed and users can also customize as the most essential ones have been unlocked.
- UI bug in tracking protection section is fixed.
- a bunch of dead links are fixed.
- for screensharing see [testing provided at this link](https://github.com/arkenfox/user.js/issues/1245)
- disable new firefox suggests feature

**Notes**
Recent changes in the category `MISC > set librewolf support and releases urls` require to create a couple header for the landing page.

#### Removed preferences
```
defaultPref("general.warnOnAboutConfig", false); // deprecated
defaultPref("dom.battery.enabled", false);
lockPref("network.http.altsvc.enabled", false);
lockPref("network.http.altsvc.oe", false);
lockPref("signon.storeWhenAutocompleteOff", false); // we do not suggest lockwise in the first place
defaultPref("signon.management.page.breach-alerts.enabled", false); // no harm for lockwise users
defaultPref("signon.management.page.breachAlertUrl", ""); // no harm for lockwise users
defaultPref("privacy.history.custom", true); // redundant
defaultPref("privacy.cpd.cookies", false);
defaultPref("privacy.cpd.offlineApps", false); // default
defaultPref("privacy.sanitize.timeSpan", 0);
defaultPref("media.gmp-widevinecdm.visible", false);
defaultPref("media.gmp-widevinecdm.enabled", false);
defaultPref("privacy.donottrackheader.enabled", true);
defaultPref("dom.vr.enabled", false);
defaultPref("dom.vibrator.enabled", false);
defaultPref("dom.push.connection.enabled", false); // redundant
defaultPref("dom.security.https_only_mode_pbm", true); // redundant
defaultPref("security.tls.version.fallback-limit", 3); // default is for, no need to enforce further
lockPref("extensions.webextensions.identity.redirectDomain", ""); // outdated and unchanged even in tor
defaultPref("extensions.getAddons.link.url", ""); // https://addons.mozilla.org/%LOCALE%/firefox/
defaultPref("extensions.getAddons.get.url", ""); // redundant
lockPref("extensions.getAddons.discovery.api_url", ""); // redundant
lockPref("webextensions.storage.sync.serverURL", ""); // sync not supported
lockPref("extensions.webservice.discoverURL", ""); // deprecated
defaultPref("xpinstall.signatures.devInfoURL", ""); // link to wiki page
lockPref("app.normandy.user_id", ""); // redundant
lockPref("app.normandy.shieldLearnMoreUrl", ""); // redundant
lockPref("security.mixed_content.block_active_content", true); // default
defaultPref("security.insecure_connection_text.pbmode.enabled", true); // redundant
lockPref("browser.safebrowsing.downloads.remote.block_dangerous", false);
lockPref("browser.safebrowsing.downloads.remote.block_dangerous_host", false);
lockPref("gfx.font_rendering.graphite.enabled", false); // consider removing
defaultPref("pdfjs.previousHandler.alwaysAskBeforeHandling", true);
defaultPref("pdfjs.enabledCache.state", false);
lockPref("remote.enabled", false); // removed in FF90
lockPref("browser.shell.didSkipDefaultBrowserCheckOnFirstRun", true); // redundant
defaultPref("browser.bookmarks.max_backups", 2);
defaultPref("devtools.performance.recording.ui-base-url", "http://localhost:55555"); // unharmful
defaultPref("devtools.devices.url", ""); // unharmful
lockPref("media.decoder-doctor.new-issue-endpoint", ""); // redundant
lockPref("identity.sync.tokenserver.uri", ""); // redundant
defaultPref("accessibility.support.url", ""); // redundant
lockPref("browser.dictionaries.download.url", ""); // dictionaries are hidden already
lockPref("browser.uitour.themeOrigin", ""); // redundant
lockPref("toolkit.datacollection.infoURL", ""); // redundant
lockPref("identity.mobilepromo.android", ""); // redundant
lockPref("identity.mobilepromo.ios", ""); // redundant
defaultPref("identity.sendtabpromo.url", ""); // redundant
lockPref("datareporting.healthreport.infoURL", ""); // redundant
lockPref("browser.chrome.errorReporter.infoURL", ""); // redundant
lockPref("datareporting.policy.firstRunURL", ""); // redundant
lockPref("javascript.options.shared_memory", false);
lockPref("app.update.staging.enabled", false); // not relevant
lockPref("app.update.lastUpdateTime.telemetry_modules_ping", 0); // redundant
lockPref("network.connectivity-service.IPv6.url", "http://0.0.0.0"); // redundant
lockPref("network.connectivity-service.IPv4.url", "http://0.0.0.0"); // redundant
lockPref("network.connectivity-service.DNSv6.domain", ""); // redundant
lockPref("network.connectivity-service.DNSv4.domain", ""); // redundant
lockPref("browser.crashReports.unsubmittedCheck.enabled", false); // default
lockPref("browser.crashReports.unsubmittedCheck.autoSubmit2", false); // default
lockPref("browser.newtabpage.activity-stream.feeds.newtabinit", false);
lockPref("browser.newtabpage.activity-stream.feeds.places", false);
lockPref("browser.newtabpage.activity-stream.feeds.systemtick", false);
lockPref("browser.newtabpage.activity-stream.feeds.system.topsites", false);
lockPref("browser.newtabpage.activity-stream.asrouter.providers.messaging-experiments", "");
lockPref("browser.newtabpage.activity-stream.asrouter.providers.message-groups", "");
lockPref("browser.newtabpage.activity-stream.asrouter.providers.cfr-fxa", "");
lockPref("browser.newtabpage.activity-stream.asrouter.providers.cfr", "");
lockPref("browser.newtabpage.activity-stream.asrouter.providers.whats-new-panel", "{\"id\":\"whats-new-panel\",\"enabled\":false}");
lockPref("browser.newtabpage.activity-stream.asrouter.devtoolsEnableds", true);
lockPref("browser.newtabpage.activity-stream.telemetry.structuredIngestion.endpoint", "");
lockPref("browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts", false);
lockPref("browser.newtabpage.activity-stream.improvesearch.handoffToAwesomebar", false);
lockPref("browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts.searchEngines", "");
lockPref("browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts.havePinned", "");
defaultPref("dom.push.userAgentID", ""); // push notifications are already disabled
lockPref("services.settings.server", ""); // redundant with patches
lockPref("webchannel.allowObject.urlWhitelist", ""); // deprecated
defaultPref("media.getusermedia.browser.enabled", false);
defaultPref("media.getusermedia.screensharing.enabled", false);
defaultPref("media.getusermedia.audiocapture.enabled", false);
defaultPref("dom.storage.next_gen", true); // default from v92.0
```

#### Added preferences
```
defaultPref("browser.download.useDownloadDir", false); // force user interaction on downloads, by always asking location
// defaultPref("security.remote_settings.crlite_filters.enabled", true);
// defaultPref("security.pki.crlite_mode", 2);
pref("browser.urlbar.quicksuggest.scenario", ""); // disable firefox suggests and hide its UI
```

#### Commented preferences
```
// pref("network.trr.mode", 2); // previously uncommented defaultPref with value 5
// pref("network.trr.uri", "https://dns.quad9.net/dns-query"); // previously uncommented defaultPref with empty value
```

#### Changed preferences
previously empty, set to proper value
```
defaultPref("network.trr.confirmationNS", "skip");
defaultPref("browser.search.searchEnginesURL", "https://gitlab.com/librewolf-community/settings/-/wikis/support#search");
defaultPref("browser.geolocation.warning.infoURL", "https://gitlab.com/librewolf-community/settings/-/wikis/support#location");
defaultPref("app.feedback.baseURL", "https://gitlab.com/librewolf-community/settings/-/wikis/support");
defaultPref("app.releaseNotesURL", "https://gitlab.com/librewolf-community/browser");
defaultPref("app.releaseNotesURL.aboutDialog", "https://gitlab.com/librewolf-community/browser");
```

#### Unlocked preferences
```
defaultPref("signon.rememberSignons", false);
defaultPref("signon.autofillForms", false);
defaultPref("signon.formlessCapture.enabled", false);
defaultPref("browser.urlbar.speculativeConnect.enabled", false);
defaultPref("browser.contentblocking.report.lockwise.enabled", false);
defaultPref("browser.contentblocking.report.monitor.enabled", false);
defaultPref("network.dns.disablePrefetch", true);
defaultPref("security.ssl.treat_unsafe_negotiation_as_broken",	true);
defaultPref("browser.startup.blankWindow", false);
defaultPref("extensions.htmlaboutaddons.recommendations.enabled", false);
defaultPref("extensions.systemAddon.update.enabled", false);
defaultPref("extensions.systemAddon.update.url", "");
defaultPref("security.mixed_content.block_display_content", true);
defaultPref("security.insecure_connection_text.enabled", true);
defaultPref("gfx.font_rendering.opentype_svg.enabled", false);
defaultPref("browser.shell.shortcutFavicons", false);
defaultPref("network.gio.supported-protocols", "");
defaultPref("network.IDN_show_punycode", true);
defaultPref("browser.shell.checkDefaultBrowser", false);
defaultPref("middlemouse.contentLoadURL", false);
defaultPref("browser.pagethumbnails.capturing_disabled", true);
defaultPref("browser.privatebrowsing.forceMediaMemoryCache", true);
defaultPref("app.update.url.details", "https://gitlab.com/librewolf-community/browser");
defaultPref("app.update.url.manual", "https://gitlab.com/librewolf-community/browser");
defaultPref("network.protocol-handler.external.ms-windows-store", false);
defaultPref("browser.newtab.preload", false);
defaultPref("browser.newtabpage.activity-stream.section.highlights.includeDownloads", false);
defaultPref("browser.newtabpage.activity-stream.section.highlights.includeVisited", false);
defaultPref("browser.newtabpage.activity-stream.feeds.topsites", false);
defaultPref("browser.safebrowsing.downloads.enabled", false);
```

## 1.6

**target commit**: 192f51abe21e9aeb9b01d396079e9b8533cab7bb

**base librewolf version**: 91.x

**References**:
- [reasoning on webgl2](https://github.com/arkenfox/user.js/commit/41c3c0ec26ef4392169fa1d04fd5783ac03bfc8e) from arkenfox's maintainer, basically disabling webgl is enough for those who don't need it. users who want it have one less pref to change.

#### Removed preferences
```
defaultPref("dom.targetBlankNoOpener.enabled", true); // default since v79.0
defaultPref("webgl.enable-webgl2", false);
lockPref("browser.newtabpage.activity-stream.feeds.section.highlights", false); // default
```

## 1.5

**target commit**: 23d1bff4f4ae3456df8e50e67f657ea6288eef29

**base librewolf version**: 91.x

**References**:
- [comment](https://github.com/arkenfox/user.js/commit/3bb9fc713f141d794fc4adfb38d3fcf86c9307ab#commitcomment-53916786) from arkenfox's maintainer regarding tls version pref
- [mozilla update service](https://support.mozilla.org/en-US/kb/enable-background-updates-firefox-windows)
- extension firewall has been revisited

#### Removed preferences
```
lockPref("security.dialog_enable_delay", 700); // default 1000, no need to enforce this
```

#### Added preferences
```
defaultPref("app.update.background.scheduling.enabled", false); // Win specific update service
defaultPref("security.tls.version.enable-deprecated", false); // default but helps resetting the preference
// defaultPref("extensions.webextensions.base-content-security-policy.v3", "default-src 'none'; script-src 'none'; object-src 'none';");
```

#### Changed preferences
```
// defaultPref("extensions.webextensions.base-content-security-policy", "default-src 'none'; script-src 'none'; object-src 'none';");
```

## 1.4
**target commit**: 2e21db4c3018321a077d9af2ec44b29675c57adf

**base librewolf version**: 90.x

#### Removed preferences
```
lockPref("security.tls.version.enable-deprecated", false); // default
```

## 1.3
**target commit**: 60e75e30c6018a5c909a2f00f40831ed3f1948a6

**base librewolf version**: 90.x

#### Added preferences
```
defaultPref("network.http.windows-sso.enabled", false);
```

#### Removed preferences
```
lockPref("browser.cache.offline.storage.enable", false); // pref does not exist anymore as it became default behavior
```

## 1.2
**target commit**: 294724fae38ffa4ebcf6dfb0854787fb7022d1e6

**base librewolf version**: 89.x

**References**:
- issue [#65](https://gitlab.com/librewolf-community/settings/-/issues/65) from settings
- issue [#22](https://gitlab.com/librewolf-community/browser/common/-/issues/22) from common

#### Removed preferences
```
defaultPref("dom.webaudio.enabled", false);
defaultPref("media.navigator.enabled", false);
```

#### Changed preferences
```
defaultPref("app.support.baseURL", "https://gitlab.com/librewolf-community/settings/-/wikis/support#");
```

## 1.1
**target commit**: cf0a2cc88acdbc51b138228353a0d7c9ea0db7c3

**base librewolf version**: 89.x

**References**:
- issue [#54](https://gitlab.com/librewolf-community/settings/-/issues/54) from settings
- merge request [#5](https://gitlab.com/librewolf-community/browser/common/-/merge_requests/5) from common

#### Removed preferences
```
defaultPref("security.OCSP.require", false); // default value
defaultPref("extensions.update.url", "");
defaultPref("extensions.update.background.url", "");
defaultPref("extensions.getAddons.search.browseURL", "");
```

#### Changed preferences
```
defaultPref("geo.provider.network.url", "https://location.services.mozilla.com/v1/geolocate?key=%MOZILLA_API_KEY%");
```

#### Added preferences
```
lockPref("privacy.override_rfp_for_color_scheme", false);
```


## 1.0
**target commit**: 2b8dc4ac6d7fb6fdf8f172d04c27912098268257

**base librewolf version**: 89.x

This is the initial release from which we start tagging and versioning settings. For previous changes see
[here](https://gitlab.com/librewolf-community/settings/-/blob/master/docs/changelog-legacy.md).
