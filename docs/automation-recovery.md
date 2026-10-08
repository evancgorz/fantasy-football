# Scheduled coaching: browser access and recovery

Updated October 8, 2026. All times are America/New_York. The six ACTIVE app automations are authoritative; automation-config.json is their versioned snapshot, not another scheduler. All use gpt-6.1-sol / medium, as requested by the owner.

## Required recovery sequence

1. Owner changed the preference to the in-app browser on October 4. Select iab first; reuse its ESPN tab or open one even when its tab inventory is empty. Do not treat missing tabs as failed authentication.
2. Open https://fantasy.espn.com/football/team?leagueId=582597924&teamId=3&seasonId=2026 in that browser. On October 4 an existing separate automation chat successfully opened a new in-app ESPN tab and read the authenticated private team page without another sign-in. Cross-chat access passed; persistence through future scheduled runs or app restarts remains untested. Verify it every run.
3. If ESPN shows Log in Required, show and preserve the tab for owner sign-in. Connected Chrome can be tried as a fallback; respect launch denial and browser permissions. Browser sessions are separate.
4. Report the precise missing-browser or observed login failure. Never read/save/share passwords, cookies, tokens, credential stores, or authentication exports in prompts, memory, task messages, or this repository. Agents receive the connection procedure only, not secrets.
5. Confirm the live league/team/season, week, roster, pending moves, and individual lock times before acting. Historical snapshots do not establish current lineup safety.
6. A blocked check is actionable: log timestamp, exact failure, uninspected game windows, and owner action needed in docs/decision-log.md; commit and push; notify the owner. Failure overrides quiet-on-no-action. Do not wait indefinitely for input.
7. Verify each ESPN action before logging/committing/pushing under change-control.md. Never claim an unverified action succeeded.
8. Preserve successful ESPN tabs and sign-in handoff tabs with the supported browser method. Do not sign out, clear browser data, extract session secrets, or clone authentication profiles. Preserving a tab does not guarantee login persistence. Allow a supported load wait and one fresh inspection when loading; avoid repeated reloads during manual sign-in.
9. On login failure, name the affected deadline, provide the preserved sign-in tab, and ask the owner to rerun after manual authentication. Scheduled runs must distinguish verified access, actual login-required, and missing browser controls.

## Active cadence

All six prompts require AGENTS.md and coaching-policy.md, the current weekly report in analysis/, and unresolved structured records in decisions/. Weekly/waiver runs write replacement-value analysis and shared handoffs; lineup runs refresh evidence and relevant sections before executing. Reports and recommendations also require commit/push even when ESPN remains read-only. The initial Week 5 handoffs are dated, partial seeds and must be refreshed live.

| Task | Runs (Eastern) | Purpose |
|---|---|---|
| Weekly review | Tuesday 9 AM | Results, standings, injuries; read-only |
| Waiver execution | Tuesday and Wednesday 7 PM | Submit before processing; verify awards afterward |
| Thursday lineup | Thursday 5 PM and 7 PM | Read-only access/injury preflight; final lineup check |
| Sunday early lineup | Sunday 8 AM and noon | Resolve early locks with recovery time; recheck 1 PM inactives |
| Sunday late lineup | Sunday 3 PM and 7 PM | Afternoon and separate night-game checks |
| Monday lineup | Monday 5 PM and 7 PM | Read-only access/injury preflight; final lineup check |

Read ESPN's actual waiver deadline and kickoff schedule each run. Fixed times do not guarantee coverage for international, Saturday, holiday, unusually early Monday, or rescheduled games. Flag a rostered-player lock preceding the next check and recommend an earlier check. Wednesday evening is not preparation for Wednesday-morning processing. Preserve existing authority boundaries and model choice.

## October 4 incident audit

- October 1 Thursday run found no in-app browser tabs and performed no ESPN inspection.
- October 4 Sunday early and late runs encountered an unauthenticated browser session and performed no ESPN inspection or changes. This did not establish the owner's Chrome authentication state.
- September 30 successful Chrome review recorded Swift awarded with no drop, Achane on IR, and no pending move. Starters: Hurts, Robinson, Taylor, Smith-Njigba, Jefferson, McBride, Jeanty, Steelers D/ST, Myers. Jefferson was questionable; Hall doubtful; Daniels questionable. These are historical, not current statuses.
- September 29 live observation had Chet and the Jets 3-0, first of four, facing Anna's Bananas in Week 4. Today's score is unverified.
- At approximately 6:59 PM Eastern October 4, available browser controls exposed only the in-app browser and MCP Apps. Explicit Chrome tab creation returned `Browser is not available: chrome`. Chrome's executable was present; launching it was blocked by tool policy. A subsequent inventory still showed no Chrome connection.

The initial audit was blocked. A subsequent authenticated in-app read confirmed real lineup damage: Jefferson was out, still starting, and locked after Minnesota's completed game. Olave and London were healthy-looking Monday bench alternatives, but cannot replace that locked slot now. The live score snapshot was 82.72 versus 162.60; Bijan remains a Monday starter. Exact missed replacement points are not yet known because those alternatives have not played. Achane's IR move and Swift's award were completed before these failures.

Use the verified in-app connection for subsequent live roster checks. Make only authorized straightforward changes to unlocked players. Estimate missed points from a genuinely unavailable starter and a replacement legally available at the original lock; separate preventable zeros from hindsight bench explosions. Log verified facts, not inferred outcomes.

## Cross-chat test evidence

On October 4, the owner authorized a read-only test in existing chat `01a10927-476f-7562-85ef-847d69217d47` (Sunday late-game lineup check), using Sol 6.1 Low. It independently opened/read an authenticated in-app page and confirmed Chet and the Jets, Gorczynski Family League, league 582597924, team 3, season 2026, NFL Week 4. Its score snapshot was 82.72-164.80 and it independently observed Jefferson out and locked, with Robinson/London/Olave scheduled Monday 8:15 PM. No ESPN or repository writes occurred during the test. This was a manual follow-up in an automation-created chat, not a fresh scheduler-triggered run or restart test.
