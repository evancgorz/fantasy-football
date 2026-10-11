# Fantasy coaching instructions

Read docs/coaching-policy.md, docs/automation-recovery.md, docs/browser-tooling.md, and docs/change-control.md before fantasy work. ESPN is authoritative; old reports are not current roster or injury evidence.

Scheduled runs must read the current season/week report in analysis/ and unresolved records in decisions/ before acting. Waiver recommendations must be written there, not left only in a task's private memory. Honor the run-specific permissions: weekly review and Thursday/Monday 5 PM preflights are ESPN read-only.

Use sourced analysis, legal individual locks, replacement value, and explicit uncertainty. Do not invent usage statistics, historical scoring distributions, or win probabilities. Keep gpt-6.1-sol / medium for all six existing tasks unless the owner changes it.

After every ESPN mutation: verify, write the human decision log and structured record, commit only intended files, and push origin main before another mutation. Repository-only reports/recommendations also require commit/push. Never commit credentials, cookies, tokens, or raw private exports. Preserve unrelated edits; do not force-push or reset. Do not edit app automation definitions during routine coaching runs.

October 11 owner delegation: hands-off team management. In action-capable runs autonomously make evidence-backed start/sit (including close calls), waiver, add/drop, IR and trade submission/acceptance decisions. No routine strategic owner approval. Optimize evidence-adjusted expected points and championship prospects, not displayed projection alone. Consequential drops/priority or FAAB sacrifices require stronger due diligence. Respect verified fantasy budgets, league rules, read-only windows and platform-required confirmations; no real-money spending, account/league changes or security weakening.

Read docs/infographics.md. Use scripts/render-infographic.ps1 for a simple sourced visual after each verified move and meaningful matchup/weekly update. Archive curated input and PNG in analysis/infographics/, link from reports, embed in final responses. Visual failure must not delay locks, verification or logging/commit/push.
