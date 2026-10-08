# Fantasy coaching instructions

Read docs/coaching-policy.md, docs/automation-recovery.md, and docs/change-control.md before fantasy work. ESPN is authoritative; old reports are not current roster or injury evidence.

Scheduled runs must read the current season/week report in analysis/ and unresolved records in decisions/ before acting. Waiver recommendations must be written there, not left only in a task's private memory. Honor the run-specific permissions: weekly review and Thursday/Monday 5 PM preflights are ESPN read-only.

Use sourced analysis, legal individual locks, replacement value, and explicit uncertainty. Do not invent usage statistics, historical scoring distributions, or win probabilities. Keep gpt-6.1-sol / medium for all six existing tasks unless the owner changes it.

After every ESPN mutation: verify, write the human decision log and structured record, commit only intended files, and push origin main before another mutation. Repository-only reports/recommendations also require commit/push. Never commit credentials, cookies, tokens, or raw private exports. Preserve unrelated edits; do not force-push or reset. Do not edit app automation definitions during routine coaching runs.
