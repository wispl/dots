// Isolate site permissions by userContext
user_pref("permissions.isolateBy.userContext", true);

user_pref("browser.startup.page", 1);
user_pref("browser.startup.homepage", "about:home");
user_pref("browser.newtabpage.enabled", true);

// keep browser open with no tabs
user_pref("browser.tabs.closeWindowWithLastTab", false);
user_pref("browser.tabs.warnOnClose", true);

// enable spreadsheets
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);

user_pref("privacy.resistFingerprinting", true);
user_pref("privacy.resistFingerprinting.letterboxing", true);
user_pref("webgl.disabled", true);
