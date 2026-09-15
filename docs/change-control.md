# Fantasy-management change control

## Policy

GitHub is the durable audit trail for this team's operational history. Every state-changing ESPN action gets its own verified log entry, Git commit, and push to the configured GitHub remote.

This applies to:

- lineup moves;
- waiver claims;
- free-agent adds and drops;
- IR moves;
- accepted or submitted trades;
- any other ESPN transaction that changes team state.

Read-only inspection, analysis, or a recommendation that does not change ESPN state does not require an empty commit. If an inspection changes a repository document, that document change is still committed and pushed.

## Required sequence

Complete these steps immediately after ESPN confirms a state-changing action:

1. Re-read ESPN and verify the intended player, slot, transaction status, and resulting roster.
2. Append one entry to `docs/decision-log.md` with the Eastern timestamp, Week, ESPN URL, action, rationale, verification, and result.
3. Run `git diff --check` and review the diff so unrelated files are not included.
4. Stage only the intended files, normally `docs/decision-log.md` and any directly related documentation.
5. Create one descriptive commit for the action, for example:

   `fantasy: start replacement for inactive player`

6. Push immediately to the configured remote and current management branch:

   `git push origin main`

7. Verify the push succeeded, the worktree is clean, and record the commit hash in the decision log or final action report.

One ESPN mutation should map to one commit. Do not batch unrelated lineup or transaction changes into a later catch-up commit.

## Failure handling

- If ESPN changes state but the log or commit fails, stop and preserve the local evidence before attempting another fantasy action.
- If the local commit succeeds but the push fails, report the commit hash and push failure. Retry the push only after checking the remote and authentication state; do not rewrite history or force-push.
- If the browser result is ambiguous, do not retry the ESPN action blindly. Re-read ESPN first.
- A transaction is not considered fully archived until its commit is present on GitHub.

## Security boundaries

Never commit:

- ESPN passwords, one-time codes, `espn_s2`, `SWID`, or browser cookies;
- API keys, OAuth tokens, or credentials;
- raw authenticated page exports containing private league data;
- unrelated user files or browser artifacts.

The browser session remains the credential boundary. GitHub receives only the minimal operational log and documentation necessary to explain the action.

## Automation contract

Every scheduled management prompt must follow this policy. For autonomous actions, the automation must verify ESPN first, write the decision-log entry second, then commit and push before reporting success. For owner-input actions, the automation may prepare a recommendation but must not commit a fictional action; it commits only after the owner-approved ESPN action is verified.
