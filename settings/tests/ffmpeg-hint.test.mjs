import { test } from "node:test";
import assert from "node:assert/strict";
import fs from "node:fs";
import path from "node:path";
import vm from "node:vm";
import { fileURLToPath } from "node:url";

const REPO_ROOT = path.resolve(path.dirname(fileURLToPath(import.meta.url)), "..", "..");
const CFG_PATH = path.join(REPO_ROOT, "settings", "librewolf.cfg");
const BEGIN = "// __VANTAGE_LINUX_FFMPEG_HINT_BEGIN__";
const END = "// __VANTAGE_LINUX_FFMPEG_HINT_END__";

function readCfg() {
  return fs.readFileSync(CFG_PATH, "utf8");
}

function extractSection(src) {
  const b = src.indexOf(BEGIN);
  const e = src.indexOf(END);
  assert.ok(b !== -1, "missing BEGIN marker in settings/librewolf.cfg");
  assert.ok(e !== -1, "missing END marker in settings/librewolf.cfg");
  assert.ok(e > b, "END marker must come after BEGIN marker");
  assert.equal(src.indexOf(BEGIN, b + 1), -1, "BEGIN marker must appear exactly once");
  assert.equal(src.indexOf(END, e + 1), -1, "END marker must appear exactly once");
  return src.slice(b + BEGIN.length, e);
}

function makeNotifyBox(existingValue = null) {
  return {
    PRIORITY_INFO_MEDIUM: 4,
    appended: [],
    getNotificationWithValue(value) {
      return value === existingValue ? { value } : null;
    },
    appendNotification(value, options, buttons) {
      this.appended.push({ value, options, buttons });
      return { value };
    },
  };
}

function makeWindow({ notifyBox, isTypeSupported, hasGBrowser = true, hasGNotificationBox = false } = {}) {
  const win = {
    document: {},
    openedLinks: [],
    openWebLinkIn(url, where) {
      win.openedLinks.push({ url, where });
    },
  };
  if (hasGBrowser) {
    win.gBrowser = {
      getNotificationBox() {
        return notifyBox;
      },
    };
  }
  if (hasGNotificationBox) {
    win.gNotificationBox = notifyBox;
  }
  if (isTypeSupported !== undefined) {
    win.MediaSource = { isTypeSupported };
  }
  return win;
}

function makeEnv(opts = {}) {
  const {
    os = "Linux",
    locale = "zh-CN",
    dismissed = false,
    helpUrl = undefined,
    ctypesMode = "found",
    ctypesFoundAt = "libavcodec.so.60",
    mostRecentWindow = null,
    prefsThrow = false,
    addObserverThrow = false,
  } = opts;

  const prefs = new Map();
  prefs.set("vantage.linux.ffmpegHint.dismissed", dismissed);
  if (helpUrl !== undefined) {
    prefs.set("vantage.linux.ffmpegHint.helpUrl", helpUrl);
  }

  const env = {
    dumps: [],
    observers: [],
    openedLibs: [],
    closedLibs: [],
    importESModuleCalls: [],
  };

  const Services = {
    appinfo: { OS: os },
    locale: { appLocaleAsBCP47: locale },
    prefs: {
      getBoolPref(name, def) {
        if (prefsThrow) throw new Error("prefs backend down");
        return prefs.has(name) ? prefs.get(name) : def;
      },
      setBoolPref(name, value) {
        prefs.set(name, value);
      },
      getStringPref(name, def) {
        return prefs.has(name) ? prefs.get(name) : def;
      },
    },
    obs: {
      addObserver(observer, topic) {
        if (addObserverThrow) throw new Error("observer service down");
        env.observers.push({ observer, topic });
      },
    },
    wm: {
      getMostRecentWindow() {
        return mostRecentWindow;
      },
    },
  };

  const ChromeUtils = {
    importESModule(uri) {
      env.importESModuleCalls.push(uri);
      if (ctypesMode === "unavailable") {
        throw new Error("ctypes module unavailable");
      }
      return {
        ctypes: {
          open(name) {
            env.openedLibs.push(name);
            if (ctypesMode === "missing") {
              throw new Error("cannot open " + name);
            }
            if (ctypesMode === "found" && name !== ctypesFoundAt) {
              throw new Error("cannot open " + name);
            }
            if (ctypesMode === "broken-open" && name === "libavcodec.so.62") {
              return { close() { throw new Error("close failed"); } };
            }
            return {
              close() {
                env.closedLibs.push(name);
              },
            };
          },
        },
      };
    },
  };

  env.Services = Services;
  env.ChromeUtils = ChromeUtils;
  env.prefs = prefs;
  return env;
}

function runSection(sectionSrc, env) {
  const context = {
    Services: env.Services,
    ChromeUtils: env.ChromeUtils,
    dump(msg) {
      env.dumps.push(msg);
    },
    defaultPrefs: [],
  };
  context.defaultPref = (name, value) => context.defaultPrefs.push({ name, value });
  vm.createContext(context);
  vm.runInContext(sectionSrc, context);
  return context;
}

function fireDelayedStartup(env, win) {
  const entry = env.observers.find((o) => o.topic === "browser-delayed-startup-finished");
  assert.ok(entry, "observer for browser-delayed-startup-finished should be registered");
  entry.observer.observe(win, "browser-delayed-startup-finished");
  return entry;
}

const SECTION = extractSection(readCfg());

test("整个 librewolf.cfg 仍为合法 JavaScript", () => {
  assert.doesNotThrow(() => new Function(readCfg()));
});

test("小节标记存在且 defaultPref 已声明", () => {
  assert.ok(SECTION.includes('defaultPref("vantage.linux.ffmpegHint.dismissed", false)'));
  assert.ok(SECTION.includes('defaultPref("vantage.linux.ffmpegHint.helpUrl"'));
  assert.ok(SECTION.includes("libavcodec.so.62"));
  assert.ok(SECTION.includes("libavcodec.so.58"));
});

test("运行小节时声明两条 defaultPref", () => {
  const env = makeEnv();
  const ctx = runSection(SECTION, env);
  assert.deepEqual(ctx.defaultPrefs, [
    { name: "vantage.linux.ffmpegHint.dismissed", value: false },
    { name: "vantage.linux.ffmpegHint.helpUrl", value: "https://asystech.cn/vantage/docs.html" },
  ]);
});

test("非 Linux 平台不注册观察者", () => {
  for (const os of ["WINNT", "Darwin"]) {
    const env = makeEnv({ os });
    runSection(SECTION, env);
    assert.equal(env.observers.length, 0, `OS=${os} should not register observer`);
  }
});

test("Linux 注册 browser-delayed-startup-finished 观察者", () => {
  const env = makeEnv();
  runSection(SECTION, env);
  assert.equal(env.observers.length, 1);
  assert.equal(env.observers[0].topic, "browser-delayed-startup-finished");
});

test("libavcodec 存在且 H.264 可播时不弹通知，且探测后关闭句柄", () => {
  const notifyBox = makeNotifyBox();
  const win = makeWindow({ notifyBox, isTypeSupported: () => true });
  const env = makeEnv({ ctypesFoundAt: "libavcodec.so.60" });
  runSection(SECTION, env);
  fireDelayedStartup(env, win);
  assert.equal(notifyBox.appended.length, 0);
  assert.deepEqual(env.openedLibs, ["libavcodec.so.62", "libavcodec.so.61", "libavcodec.so.60"]);
  assert.deepEqual(env.closedLibs, ["libavcodec.so.60"]);
});

test("libavcodec 全部缺失时弹出简体中文通知（含两个按钮）", () => {
  const notifyBox = makeNotifyBox();
  const win = makeWindow({ notifyBox, isTypeSupported: () => false });
  const env = makeEnv({ ctypesMode: "missing" });
  runSection(SECTION, env);
  fireDelayedStartup(env, win);
  assert.equal(env.openedLibs.length, 5, "应依序探测 5 个 soname");
  assert.equal(notifyBox.appended.length, 1);
  const n = notifyBox.appended[0];
  assert.equal(n.value, "vantage-linux-ffmpeg-hint");
  assert.equal(n.options.priority, notifyBox.PRIORITY_INFO_MEDIUM);
  assert.ok(n.options.label.includes("FFmpeg"));
  assert.ok(n.options.label.includes("哔哩哔哩"));
  assert.equal(n.buttons.length, 2);
  assert.equal(n.buttons[0].label, "安装指引");
  assert.equal(n.buttons[1].label, "不再提示");
  assert.equal(typeof n.buttons[0].callback, "function");
  assert.equal(typeof n.buttons[1].callback, "function");
});

test("有 libavcodec 但 H.264 解码器缺失（ffmpeg-free）时仍弹通知", () => {
  const notifyBox = makeNotifyBox();
  const win = makeWindow({ notifyBox, isTypeSupported: () => false });
  const env = makeEnv({ ctypesMode: "found", ctypesFoundAt: "libavcodec.so.61" });
  runSection(SECTION, env);
  fireDelayedStartup(env, win);
  assert.equal(notifyBox.appended.length, 1);
});

test("ctypes 不可用且 H.264 可播时不误报", () => {
  const notifyBox = makeNotifyBox();
  const win = makeWindow({ notifyBox, isTypeSupported: () => true });
  const env = makeEnv({ ctypesMode: "unavailable" });
  runSection(SECTION, env);
  fireDelayedStartup(env, win);
  assert.equal(notifyBox.appended.length, 0);
});

test("两个探针都不可用时静默跳过，不打扰用户", () => {
  const notifyBox = makeNotifyBox();
  const win = makeWindow({ notifyBox });
  const env = makeEnv({ ctypesMode: "unavailable" });
  runSection(SECTION, env);
  fireDelayedStartup(env, win);
  assert.equal(notifyBox.appended.length, 0);
  assert.equal(env.dumps.length, 0);
});

test("ctypes.open 成功但 close 抛异常时不影响判定", () => {
  const notifyBox = makeNotifyBox();
  const win = makeWindow({ notifyBox, isTypeSupported: () => true });
  const env = makeEnv({ ctypesMode: "broken-open" });
  runSection(SECTION, env);
  fireDelayedStartup(env, win);
  assert.equal(notifyBox.appended.length, 0);
  assert.equal(env.dumps.length, 0);
});

test("用户已点「不再提示」时不再检测、不再弹通知", () => {
  const notifyBox = makeNotifyBox();
  const win = makeWindow({ notifyBox, isTypeSupported: () => false });
  const env = makeEnv({ ctypesMode: "missing", dismissed: true });
  runSection(SECTION, env);
  fireDelayedStartup(env, win);
  assert.equal(notifyBox.appended.length, 0);
  assert.equal(env.openedLibs.length, 0, "已忽略提示时不应再做探测");
});

test("点击「不再提示」写入 dismissed pref", () => {
  const notifyBox = makeNotifyBox();
  const win = makeWindow({ notifyBox, isTypeSupported: () => false });
  const env = makeEnv({ ctypesMode: "missing" });
  runSection(SECTION, env);
  fireDelayedStartup(env, win);
  const dismissBtn = notifyBox.appended[0].buttons[1];
  dismissBtn.callback();
  assert.equal(env.prefs.get("vantage.linux.ffmpegHint.dismissed"), true);
});

test("点击「安装指引」在新标签页打开帮助地址", () => {
  const notifyBox = makeNotifyBox();
  const win = makeWindow({ notifyBox, isTypeSupported: () => false });
  const env = makeEnv({ ctypesMode: "missing" });
  runSection(SECTION, env);
  fireDelayedStartup(env, win);
  notifyBox.appended[0].buttons[0].callback();
  assert.deepEqual(win.openedLinks, [
    { url: "https://asystech.cn/vantage/docs.html", where: "tab" },
  ]);
});

test("帮助地址可通过 helpUrl pref 自定义", () => {
  const notifyBox = makeNotifyBox();
  const win = makeWindow({ notifyBox, isTypeSupported: () => false });
  const env = makeEnv({ ctypesMode: "missing", helpUrl: "https://example.com/ffmpeg" });
  runSection(SECTION, env);
  fireDelayedStartup(env, win);
  notifyBox.appended[0].buttons[0].callback();
  assert.equal(win.openedLinks[0].url, "https://example.com/ffmpeg");
});

test("openWebLinkIn 抛异常时点击帮助按钮不崩溃", () => {
  const notifyBox = makeNotifyBox();
  const win = makeWindow({ notifyBox, isTypeSupported: () => false });
  win.openWebLinkIn = () => {
    throw new Error("popup blocked");
  };
  const env = makeEnv({ ctypesMode: "missing" });
  runSection(SECTION, env);
  fireDelayedStartup(env, win);
  assert.doesNotThrow(() => notifyBox.appended[0].buttons[0].callback());
});

test("同款通知已存在时不重复追加", () => {
  const notifyBox = makeNotifyBox("vantage-linux-ffmpeg-hint");
  const win = makeWindow({ notifyBox, isTypeSupported: () => false });
  const env = makeEnv({ ctypesMode: "missing" });
  runSection(SECTION, env);
  fireDelayedStartup(env, win);
  assert.equal(notifyBox.appended.length, 0);
});

test("zh-Hant 语言环境显示繁体文案", () => {
  const notifyBox = makeNotifyBox();
  const win = makeWindow({ notifyBox, isTypeSupported: () => false });
  const env = makeEnv({ ctypesMode: "missing", locale: "zh-TW" });
  runSection(SECTION, env);
  fireDelayedStartup(env, win);
  const n = notifyBox.appended[0];
  assert.ok(n.options.label.includes("影片"));
  assert.equal(n.buttons[0].label, "安裝指引");
  assert.equal(n.buttons[1].label, "不再提示");
});

test("英文语言环境显示英文文案", () => {
  const notifyBox = makeNotifyBox();
  const win = makeWindow({ notifyBox, isTypeSupported: () => false });
  const env = makeEnv({ ctypesMode: "missing", locale: "en-US" });
  runSection(SECTION, env);
  fireDelayedStartup(env, win);
  const n = notifyBox.appended[0];
  assert.ok(n.options.label.includes("Bilibili"));
  assert.equal(n.buttons[0].label, "Install guide");
  assert.equal(n.buttons[1].label, "Don't show again");
});

test("locale 服务异常时回退到英文文案且不崩溃", () => {
  const notifyBox = makeNotifyBox();
  const win = makeWindow({ notifyBox, isTypeSupported: () => false });
  const env = makeEnv({ ctypesMode: "missing" });
  delete env.Services.locale;
  runSection(SECTION, env);
  fireDelayedStartup(env, win);
  assert.equal(notifyBox.appended.length, 1);
  assert.ok(notifyBox.appended[0].options.label.includes("Bilibili"));
});

test("每会话只检测一次：第二个窗口不再探测", () => {
  const notifyBox = makeNotifyBox();
  const win1 = makeWindow({ notifyBox, isTypeSupported: () => true });
  const win2 = makeWindow({ notifyBox, isTypeSupported: () => false });
  const env = makeEnv({ ctypesFoundAt: "libavcodec.so.62" });
  runSection(SECTION, env);
  const entry = fireDelayedStartup(env, win1);
  entry.observer.observe(win2, "browser-delayed-startup-finished");
  assert.deepEqual(env.openedLibs, ["libavcodec.so.62"]);
  assert.equal(notifyBox.appended.length, 0);
});

test("事件主体不是浏览器窗口时回退到 mostRecentWindow", () => {
  const notifyBox = makeNotifyBox();
  const realWin = makeWindow({ notifyBox, isTypeSupported: () => false });
  const env = makeEnv({ ctypesMode: "missing", mostRecentWindow: realWin });
  runSection(SECTION, env);
  fireDelayedStartup(env, { someOtherSubject: true });
  assert.equal(notifyBox.appended.length, 1);
});

test("找不到任何可用窗口时静默返回", () => {
  const env = makeEnv({ ctypesMode: "missing", mostRecentWindow: null });
  runSection(SECTION, env);
  assert.doesNotThrow(() => fireDelayedStartup(env, null));
  assert.equal(env.dumps.length, 0);
});

test("getNotificationBox 抛异常时使用 gNotificationBox 兜底", () => {
  const notifyBox = makeNotifyBox();
  const win = makeWindow({ notifyBox, isTypeSupported: () => false });
  win.gBrowser = {
    getNotificationBox() {
      throw new Error("notification box unavailable");
    },
  };
  win.gNotificationBox = notifyBox;
  const env = makeEnv({ ctypesMode: "missing" });
  runSection(SECTION, env);
  fireDelayedStartup(env, win);
  assert.equal(notifyBox.appended.length, 1);
});

test("检测过程抛异常时被捕获并 dump，不使启动失败", () => {
  const notifyBox = makeNotifyBox();
  const win = makeWindow({ notifyBox, isTypeSupported: () => false });
  const env = makeEnv({ ctypesMode: "missing", prefsThrow: true });
  runSection(SECTION, env);
  assert.doesNotThrow(() => fireDelayedStartup(env, win));
  assert.equal(notifyBox.appended.length, 0);
  assert.equal(env.dumps.length, 1);
  assert.ok(env.dumps[0].includes("Vantage linux-ffmpeg-hint check failed"));
});

test("观察者注册失败时被外层捕获并 dump", () => {
  const env = makeEnv({ addObserverThrow: true });
  assert.doesNotThrow(() => runSection(SECTION, env));
  assert.equal(env.dumps.length, 1);
  assert.ok(env.dumps[0].includes("Vantage linux-ffmpeg-hint setup failed"));
});
