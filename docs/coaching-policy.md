# Evidence-based coaching policy

Effective October 8, 2026. Team: Chet and the Jets, ESPN league 582597924, team 3, season 2026. All deadlines use America/New_York with an explicit UTC offset. Confirm live league rules; the four-team PPR snapshot is not permanent evidence.

## Required analysis

1. Verify browser access, current week, roster, scoring rules, individual locks, and pending claims. Protect the next kickoff first; do not delay an obvious inactive replacement for research.
2. Read analysis/YYYY-week-NN.md and unresolved decisions/*.json. Ignore other weeks for current actions; retained history is useful only as background. Refresh stale evidence before execution.
3. Gather injury status, latest practice participation, expected workload, and opponent context. Where accessible, compare recent and season snaps, routes, targets, carries, and goal-line work. Record source URL and observation time for numeric claims. NFL/team injury reports and directly sourced statistics take precedence over unsupported commentary. Mark unavailable metrics unknown; do not invent them or imply a complete usage review.
4. Evaluate current starters, each bench player, at least three relevant available acquisition candidates when available, and legal defense/kicker alternatives. A familiar name or premium roster percentage alone is not a reason to retain a bench player. Record concrete retain/replace/monitor reasoning for each bench spot, including rest-of-season role, injury timeline, bye weeks, playoff schedule, and availability of a similar replacement. Explain when fewer candidates are available or there is no useful role match.
5. Compare opponent and our legal lineup under the actual scoring format. Include base, downside, and upside qualitative scenarios for close decisions; any numeric scenario must list its sourced inputs and assumptions. Correlated players can affect upside, but do not claim precise covariance or win probabilities without validated data. Do not chase variance for its own sake or sacrifice substantial expected points merely because we trail.
6. For trades evaluate the resulting starting lineup, remaining depth, and available pickup filling each opened slot. Compare the whole roster after a trade, not the sum of famous names. Prepare terms/recommendations only; owner approval is required before submission or acceptance.

## Replacement value and authority

- Autonomously execute straightforward legal lineup upgrades and confirmed inactive replacements within lineup-run scope. Recheck health and lock eligibility; projections are one input, not proof of expected workload.
- Waiver execution may replace a genuinely expendable bench player for a clear injury replacement, streamer, or meaningful upgrade when the run's existing acquisition authority permits it and there is no substantial budget/priority sacrifice.
- Expendable means limited plausible near-term starting value, comparable alternatives available, and no persuasive role/health/schedule reason to preserve the player. Never treat all bench players as untouchable. Conversely, a temporary projection gap alone does not make a returning starter or promising prospect expendable.
- Dropping core starters/premium prospects, close consequential drops, major priority/FAAB sacrifices, trades, and close strategic start/sit choices require owner input. Present the best alternative and a deadline, not an unexplained refusal. Do not expand authority because another team is more active.
- Defense/kicker churn has no arbitrary minimum projection threshold. Compare scoring environment, underlying matchup, uncertainty, drop value, roster capacity, and waiver priority. Small uncertain gains may justify retaining; explain why instead of simply rejecting anything under one point.
- Weekly review and 5 PM Thursday/Monday access checks do not mutate ESPN. They may write reports and recommendation records. Waiver runs do not silently perform lineup swaps; record a handoff for the lineup run.

## Reports and handoffs

Weekly review creates/updates analysis/YYYY-week-NN.md using docs/templates/weekly-analysis.md. Waiver execution refreshes acquisition analysis before Tuesday processing deadlines and Wednesday outcomes. Lineup runs update the relevant report sections and structured decision statuses, without rebuilding a full usage report when kickoff is near.

Create one decisions/<decision-id>.json using docs/templates/decision-record.json for each material recommendation, retain decision, escalation, executed action, or failed check. Each record includes evidence/uncertainty, alternatives, decision-time expected benefit, responsible automation, recheck time, action deadline, owner-approval requirement, and terminal verification/outcome. Link the record from the weekly report. Private automation memory is not the only handoff channel.

Consumer runs must verify season/week, current player availability, approval, and locks before acting. A pending record is not authorization. After the deadline, do not execute it; mark expired and record whether the opportunity was missed. Waiver submissions are submitted, not completed, until the award is verified. Never mark a player swap completed based on a recommendation alone. Rejected/superseded recommendations retain their history.

Commit/push repository reports and records even on ESPN-read-only runs. Do not emit an empty commit. Quiet notifications are allowed only when nothing meaningful happened and no deadline, blocked access, or owner decision is outstanding. On concurrent repo edits, preserve the other writer's work and avoid overlapping writes; reread the current record before replacing it. No task messages are needed for ordinary handoffs.

## Early locks and injury fallback

Sunday early check runs at 8 AM Eastern and noon. At 8 AM resolve any rostered early-game starter before his individual lock; inspect international games and refresh any related injury recommendation. If a player has an earlier lock than this cadence, flag the gap on the preceding run and recommend an earlier check. At noon recheck 1 PM starters using current injury/inactive evidence and best legal replacements. Sunday 3 PM and 7 PM runs cover later windows; Thursday/Monday 5 PM preflights provide access/injury warning before 7 PM action checks. Actual kickoff times override assumptions about the usual window.

Week 5 handoff: Hurts was observed scheduled Sunday October 11 at 9:30 AM Eastern, Daniels at 1 PM. Reassess Daniels' return and workload before choosing; moving away from early-lock Hurts requires a credible later-game fallback if Daniels' availability is uncertain. Jefferson requires a pre-1 PM status check with Olave/London as candidates, not a permanently fixed fallback ranking. These are dated observations to refresh, not orders to start any specific player.

## Decision scorecard

After games settle, weekly review fills actual outcome and process review for the previous week's relevant records. Compare selected and available alternatives, separate avoidable inactive zeros/access failures from healthy-player variance, and judge with information available at decision time. Actual hindsight scoring does not establish that a different choice was knowably better. Do not fabricate a counterfactual if original roster/lock availability is unknown. Note stat corrections and pending outcomes. Carry lessons into the next report without rewriting historical rationale.

## Simulation gate

No simulation engine or generated win probability is enabled. Before adding one, require scoring-compatible historical samples, documented sample sizes, calibrated uncertainty, missing-data handling, correlated outcomes, backtesting, reproducible inputs, and a comparison against a simple projection baseline. Until then use transparent sourced scenarios and explicit confidence labels, not precise-looking Monte Carlo output.
