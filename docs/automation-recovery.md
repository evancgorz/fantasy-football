# Scheduled coaching: Chrome recovery

Updated October 4, 2026. All times are America/New_York. The six ACTIVE app automations are authoritative; automation-config.json is their versioned snapshot, not another scheduler. All use gpt-6.1-sol / low, as requested by the owner.

## Required recovery sequence

1. Owner changed the preference to the in-app browser on October 4. Select iab first; reuse its ESPN tab or open one even when its tab inventory is empty. Do not treat missing tabs as failed authentication.
2. Open https://fantasy.espn.com/football/team?leagueId=582597924&teamId=3&seasonId=2026 in that browser. Its authenticated team page was verified in this coaching task on October 4. Cross-task scheduled-run access is not yet proven; verify it every run.
3. If ESPN shows Log in Required, show and preserve the tab for owner sign-in. Connected Chrome can be tried as a fallback; respect launch denial and browser permissions. Browser sessions are separate.
4. Report the precise missing-browser or observed login failure. Never read/save/share passwords, cookies, tokens, credential stores, or authentication exports in prompts, memory, task messages, or this repository. Agents receive the connection procedure only, not secrets.
5. Confirm the live league/team/season, week, roster, pending moves, and individual lock times before acting. Historical snapshots do not establish current lineup safety.
6. A blocked check is actionable: log timestamp, exact failure, uninspected game windows, and owner action needed in docs/decision-log.md; commit and push; notify the owner. Failure overrides quiet-on-no-action. Do not wait indefinitely for input.
7. Verify each ESPN action before logging/committing/pushing under change-control.md. Never claim an unverified action succeeded.

## Active cadence

| Task | Runs (Eastern) | Purpose |
|---|---|---|
| Weekly review | Tuesday 9 AM | Results, standings, injuries; read-only |
| Waiver execution | Tuesday and Wednesday 7 PM | Submit before processing; verify awards afterward |
| Thursday lineup | Thursday 7 PM | Later pregame check |
| Sunday early lineup | Sunday 9 AM and noon | Early-game and closer-to-kickoff checks |
| Sunday late lineup | Sunday 3 PM and 7 PM | Afternoon and separate night-game checks |
| Monday lineup | Monday 7 PM | Later pregame check |

Read ESPN's actual waiver deadline and kickoff schedule each run. Fixed times do not guarantee coverage for international, Saturday, holiday, unusually early Monday, or rescheduled games. Flag a rostered-player lock preceding the next check and recommend an earlier check. Wednesday evening is not preparation for Wednesday-morning processing. Preserve existing authority boundaries and model choice.

## October 4 incident audit

- October 1 Thursday run found no in-app browser tabs and performed no ESPN inspection.
- October 4 Sunday early and late runs encountered an unauthenticated browser session and performed no ESPN inspection or changes. This did not establish the owner's Chrome authentication state.
- September 30 successful Chrome review recorded Swift awarded with no drop, Achane on IR, and no pending move. Starters: Hurts, Robinson, Taylor, Smith-Njigba, Jefferson, McBride, Jeanty, Steelers D/ST, Myers. Jefferson was questionable; Hall doubtful; Daniels questionable. These are historical, not current statuses.
- September 29 live observation had Chet and the Jets 3-0, first of four, facing Anna's Bananas in Week 4. Today's score is unverified.
- At approximately 6:59 PM Eastern October 4, available browser controls exposed only the in-app browser and MCP Apps. Explicit Chrome tab creation returned `Browser is not available: chrome`. Chrome's executable was present; launching it was blocked by tool policy. A subsequent inventory still showed no Chrome connection.

The initial audit was blocked. A subsequent authenticated in-app read confirmed real lineup damage: Jefferson was out, still starting, and locked after Minnesota's completed game. Olave and London were healthy-looking Monday bench alternatives, but cannot replace that locked slot now. The live score snapshot was 82.72 versus 162.60; Bijan remains a Monday starter. Exact missed replacement points are not yet known because those alternatives have not played. Achane's IR move and Swift's award were completed before these failures.

After Chrome connection is restored, immediately inspect the live Week 4 score, starters/bench, inactives, locks, remaining Sunday/Monday players, and transactions. Make only authorized straightforward changes to unlocked players. Estimate missed points from a genuinely unavailable starter and a replacement legally available at the original lock; separate preventable zeros from hindsight bench explosions. Log verified facts, not inferred outcomes.
