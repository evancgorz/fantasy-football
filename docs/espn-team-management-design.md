# ESPN Fantasy Team-Management Design

Status: Initial operating design
Last verified: 2026-09-13
Team: Chet and the Jets
Manager: Evan Gorczynski

## 1. Purpose

Operate Chet and the Jets as a championship-seeking fantasy team while preserving league-rule compliance, avoiding preventable missed lineups, and maintaining an auditable record of material decisions.

The design deliberately separates:

1. **Observation** — read ESPN state and current football context.
2. **Decision** — compare lineup, waiver, and trade options using the league's scoring and schedule.
3. **Execution** — make the smallest required change in ESPN.
4. **Verification** — reread ESPN and confirm the intended state actually persisted.

## 2. System boundary and connection model

### Authoritative system

ESPN Fantasy Football is authoritative for:

- roster and lineup state;
- scoring settings and lock times;
- waiver order, claims, and transactions;
- matchups, standings, and playoff qualification;
- the league's actual transaction outcome.

The currently connected browser tab is the user's authenticated Chrome session. The observed team URL is:

`https://fantasy.espn.com/football/team?leagueId=582597924&teamId=3&seasonId=2026`

Identifiers confirmed from the live page:

| Field | Value |
|---|---|
| League | Gorczynski Family League |
| League ID | `582597924` |
| Season | `2026` |
| Team | Chet and the Jets |
| Team ID | `3` |
| Manager | Evan Gorczynski |

### Browser/API split

The authenticated ESPN browser is the canonical control plane for all changes. This is resilient to private-league authentication and lets ESPN validate roster eligibility, locks, and confirmation dialogs.

An unofficial ESPN read API may be used later as an optional analysis accelerator, but it is not a dependency and must not be treated as a stable public contract. No ESPN credentials or authentication cookies belong in this repository.

### Connection procedure

1. Find the open Chrome tab whose title contains `Chet and the Jets Clubhouse` and whose URL contains `leagueId=582597924` and `teamId=3`.
2. If the tab is missing, open ESPN Fantasy Football and let the manager sign in manually. Never request or store the password, one-time code, `espn_s2`, or `SWID`.
3. Confirm the visible league, team, season, and manager before taking action.
4. Read league settings and the current roster before making recommendations.
5. For every write, perform one ESPN action, reread the affected page, and verify the result.

## 3. Confirmed league configuration

This is a snapshot from ESPN League Settings captured on 2026-09-13. Refresh it before relying on any time-sensitive rule.

### Format and roster

- Four teams.
- League Manager format; league is not publicly viewable.
- Head-to-head points, one point per reception (PPR).
- 16 total roster slots: 9 starters, 7 bench slots, and 1 IR slot.
- NFL player universe.
- Undroppable-player list is enforced.
- Lineup protection is off.
- Snake draft; 90 seconds per pick.
- Draft occurred September 5, 2026 at 3:15 PM EDT.

Starting lineup:

| Slot | Count |
|---|---:|
| QB | 1 |
| RB | 2 |
| WR | 2 |
| TE | 1 |
| FLEX | 1 |
| D/ST | 1 |
| K | 1 |

Position maximums are QB 4, RB 8, WR 8, TE 3, D/ST 3, and K 3.

### Scoring priorities

| Category | Rule |
|---|---|
| Passing yards | 0.04 points per yard |
| Passing TD | 4 |
| Interception thrown | -2 |
| Rushing yards | 0.1 points per yard |
| Rushing TD | 6 |
| Receiving yards | 0.1 points per yard |
| Reception | 1 |
| Receiving TD | 6 |
| Passing/rushing/receiving 2-point conversion | 2 |
| PAT made | 1 |
| Missed field goal | -1 |
| Field goal made | 3 / 4 / 5 / 6 for 0–39 / 40–49 / 50–59 / 60+ yards |
| Defensive sack | 1 |
| Defensive interception or fumble recovery | 2 |
| Defensive safety | 2 |
| Defensive TD | 6 |
| Defensive blocked kick | 2 |
| Defensive points allowed | 5 for 0, 4 for 1–6, 3 for 7–13, 1 for 14–17, -1 for 28–34, -3 for 35–45, -5 for 46+ |
| Defensive total yards allowed | 5 for under 100, 3 for 100–199, 2 for 200–299, -1 for 350–399, -3 for 400–449, -5 for 450–499, -6 for 500–549, -7 for 550+ |
| Fumbles lost | -2 |

The scoring profile makes reception volume, touchdown equity, rushing/receiving efficiency, and matchup-specific D/ST selection especially important. Kicker and D/ST decisions should be evaluated separately from offensive lineup projections.

### Acquisition, trade, and schedule rules

- Lineups lock individually at each player's scheduled game time.
- Player acquisition system: waivers.
- Waiver period: 1 day.
- Waiver order resets each week to inverse order of standings.
- Season acquisition limit: none.
- Trade limit: none.
- Trade deadline: December 2, 2026 at 12:00 PM EST.
- Trade review period: 1 day.
- One veto vote is required.
- Regular season: 14 one-week matchups.
- Playoffs: four teams; first playoff round is one week and the championship round is two weeks.
- Playoff seeding tiebreaker: total points for.
- Playoff reseeding: off.
- Keeper rules: off for 2026 and 2027.

## 4. Initial team snapshot

This roster was visible in the connected ESPN team page on 2026-09-13. It is a baseline, not a substitute for a fresh pre-lock check.

### Starters

| Slot | Player | NFL team | Observed note |
|---|---|---|---|
| QB | Jayden Daniels | WSH | Starting |
| RB | Bijan Robinson | ATL | Starting |
| RB | Jonathan Taylor | IND | Starting |
| WR | Jaxon Smith-Njigba | SEA | Starting |
| WR | Justin Jefferson | MIN | Starting |
| TE | Trey McBride | ARI | Starting |
| FLEX | De'Von Achane | MIA | Starting |
| D/ST | Steelers | PIT | Starting |
| K | Jason Myers | SEA | Starting |

### Bench and IR

| Slot | Player | NFL team | Observed note |
|---|---|---|---|
| Bench | Omarion Hampton | LAC | Bench |
| Bench | Ashton Jeanty | LV | Bench |
| Bench | Drake London | ATL | Bench |
| Bench | Jeremiyah Love | ARI | Questionable indicator visible |
| Bench | Chris Olave | NO | Bench |
| Bench | Garrett Wilson | NYJ | Bench |
| Bench | Breece Hall | NYJ | Bench |
| IR | Empty | — | No player currently on IR |

The initial page showed the current matchup as Anna's Bananas 58.22 versus Chet and the Jets 82.9, with the next matchup listed as Chet and the Jets versus PAYrents. Live scores are volatile and must be reread before decisions.

The observed waiver-order badge was `3 of 4`.

## 5. Operating cadence

### Every week

1. **Post-week review:** check final score, stat corrections, standings, and upcoming schedule.
2. **Waiver cycle:** inspect injuries, role changes, snap/route trends, upcoming schedules, and available players before the one-day waiver deadline. Preserve priority for meaningful upgrades.
3. **Midweek review:** recheck player news, practice participation, depth-chart changes, and matchup context.
4. **Pre-lock review:** check every starter and high-value bench player before each relevant NFL kickoff because locks are individual.
5. **Sunday/Monday monitoring:** update decisions only for players whose games have not started; never assume the whole roster remains editable.
6. **Post-action verification:** confirm the lineup, waiver claim, add/drop, or trade status in ESPN and record material actions in the decision log.

### Decision hierarchy

When choices conflict, prioritize:

1. legal active lineup and avoiding empty/locked slots;
2. expected weekly points for the current matchup;
3. playoff and schedule value;
4. roster stability and injury insulation;
5. long-term trade and waiver value.

Do not chase projected points at the expense of a locked player, an ineligible slot, or a materially better future roster structure without recording the tradeoff.

## 6. Action safety policy

| Action | Default operating mode | Required verification |
|---|---|---|
| Read roster, settings, standings, schedule, news | Execute directly | Confirm page identity and season |
| Move a player between legal lineup slots | Execute after preflight | Confirm player, slot, opponent, and game lock status |
| Submit a waiver claim | Execute after evaluating alternatives | Confirm claim, bid/priority behavior, and resulting roster capacity |
| Add a free agent / drop a player | Execute only after checking replacement value | Confirm drop target, undroppable status, roster count, and final roster |
| Trade proposal | Prepare recommendation and terms | Recheck deadline, roster legality, and opponent context before submission |
| Accept a trade | Treat as high impact | Verify both sides, review period, and playoff impact immediately before submit |
| Change league settings or send league messages | Do not do as part of team management | Requires a separate explicit request |

Never blindly repeat a click after an unclear ESPN response. Reread the page, inspect any dialog or toast, and determine whether the action succeeded before retrying.

## 7. Proposed implementation shape

The repository can grow into a small, auditable system without making ESPN API access a hard dependency:

```text
LeagueSnapshotProvider
  ├─ BrowserSnapshotProvider   (authoritative, authenticated)
  └─ OptionalReadApiProvider   (faster analysis, unofficial)

DecisionEngine
  ├─ LeagueRules
  ├─ PlayerContext
  ├─ MatchupModel
  └─ WaiverAndTradeModel

ActionExecutor
  └─ BrowserExecutor           (only write path)

Verifier
  └─ reread ESPN and compare expected vs. actual state

DecisionLog
  └─ docs/decision-log.md or a future structured data store
```

Each future automated run should produce a compact snapshot containing:

- capture time and ESPN URL;
- league/team/season identifiers;
- current matchup and standings;
- roster with slot, status, opponent, and lock state;
- available waiver candidates and proposed claims;
- recommended actions and the reason for each;
- executed actions and verification result;
- unresolved risks or missing information.

## 8. Immediate next step

Before the first management decision, refresh the current team page and collect:

1. current Week 1 score and matchup state;
2. latest injury/news indicators, especially for questionable players;
3. all currently available waiver candidates;
4. standings and next two matchup opponents;
5. any pending transactions.

The first tactical objective is to establish a clean Week 1 lineup and identify whether any waiver claim has positive expected value without weakening the roster.

## 9. Version-control requirement

GitHub is the durable audit trail for fantasy-management actions. The complete procedure is in [change-control.md](change-control.md).

After every confirmed ESPN state change—lineup move, waiver claim, add/drop, IR move, or other transaction:

1. Verify the result in ESPN.
2. Append the action, rationale, timestamp, and verification result to `docs/decision-log.md`.
3. Commit only the intended documentation changes with a descriptive `fantasy:` commit message.
4. Push immediately to `origin` on the current management branch.
5. Confirm the worktree is clean and retain the commit hash in the action record.

If a push fails, report the local commit and the push failure; do not claim the action is fully archived until the commit reaches GitHub. Never commit passwords, session cookies, ESPN authentication values, API keys, or raw private exports.
