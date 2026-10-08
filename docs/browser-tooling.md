# Browser tooling readiness and recovery

Use the installed desktop browser integration, not shell browser control, raw CDP, credential exports, or a replacement third-party browser. Keep the existing in-app preference and site security/approval checks. A visible or queued panel is not evidence of a readable browser session.

## Choose the available supported tool

1. Inspect the current tool inventory on each run. Prefer unified Computer Use (`mcp__cua_repl.js`) when exposed. Follow its first-call entry-point instructions exactly, read the returned documentation, select the in-app browser, and inspect or create a team tab even if the tab list is empty.
2. If that particular tool is absent, inspect whether the installed Browser plugin exposes its supported Node REPL (`mcp__node_repl__js`). Missing one namespace does not establish that every browser tool is missing.
3. In the Browser Node REPL, reuse an already initialized `agent` and selected `browser`. Do not reset/import another runtime just because a tab is missing or a page times out. If initialization has not succeeded, initialize the installed Browser runtime once as described below. Read the selected browser's complete documentation before navigation or inspection.
4. If neither tool exists, or trusted setup fails, stop browser actions and report a tooling failure with the affected kickoff/deadline. Do not ask for an ESPN password or declare login-required unless an actual readable ESPN page displays it. Opening a panel cannot repair absent controls.

## Installed Browser runtime setup

October 8 inspection confirmed `browser@openai-bundled` and `unified-computer-use@openai-bundled` installed/enabled at version 26.1002.52244. The Browser plugin's bundled skills directory was empty in the two old Sunday chats; its supported Node tool was present but `agent`/`cua` were not initialized. The public ChatGPT plugin-permissions connector did not resolve these local bundled identities correctly; its `not_installed` answer is not authoritative for local Codex installation. Use local plugin metadata and actual tool availability.

Before setup, verify the installed version/path using `codex plugin list --marketplace openai-bundled --json` and a read-only file-existence check. These diagnostics do not control a browser. Do not download runtime code, modify the plugin cache, or assume this versioned path remains valid after an app update.

For the currently verified Windows installation, in the Browser plugin's Node REPL only:

```javascript
var { setupBrowserRuntime } = await import(
  'file:///C:/Users/Evan%20Gorczynski/.codex/plugins/cache/openai-bundled/browser/26.1002.52244/scripts/browser-client.mjs'
);
var agent = await setupBrowserRuntime();
var browser = await agent.browsers.get('iab');
nodeRepl.write(await browser.documentation());
```

Use this only when no successful runtime initialization exists. If installation changes, obtain the current installed path from metadata rather than trying guessed versions. Use the file URL for Windows module imports. Do not inspect implementation internals or call private service/RPC methods. Setup uses the Browser plugin's trusted browser service and existing policy enforcement.

After reading returned documentation, use only its listed APIs to obtain/create the ESPN team tab, navigate if necessary, read live team/league/season/week and individual locks, and preserve the tab with the supported method. Stop on any denied action rather than finding another route around it. A normal timeout may be investigated with a fresh supported inventory/page inspection and one bounded retry; do not repeatedly reload sign-in forms.

## Evidence and failure classification

Record tool surface, setup result, observation time, live identity/week, inspected locks, preserved tab, and missing evidence. Separate `tools-unavailable`, `runtime-uninitialized`, `browser-unavailable`, `login-required`, and `usage-limit`. Tool-call completion alone is not proof that setup or live inspection succeeded. A usage failure is not an ESPN authentication failure; do not change model, redeem resets, buy credits, or repeatedly relaunch tests without authority.

The October 8 recovery retest initially ended on account usage errors after setup calls. The subsequent supported-runtime follow-up succeeded in BOTH Sunday chats at approximately 6:53 AM EDT: each read authenticated league 582597924/team 3/season 2026/Week 5, individual locks and roster, and preserved its own tab. No ESPN mutation occurred. All six saved prompts now require this readiness procedure, while retaining their existing model, schedules and authority. Future scheduled runs must independently verify access; manual tests do not prove unattended dispatch or restart persistence.
