# Fantasy Football Operations

This repository contains the operating design and decision records for managing the ESPN Fantasy Football team **Chet and the Jets**.

Start here:

- [ESPN team-management design](docs/espn-team-management-design.md)
- [Decision log template](docs/decision-log.md)
- [Change-control and GitHub workflow](docs/change-control.md)

The authenticated ESPN browser session is the source of truth for team state and the only intended write path. Do not commit passwords, session cookies, `espn_s2`, `SWID`, API keys, or exported private league data.

Every state-changing fantasy action must be recorded, committed, and pushed to the configured GitHub remote immediately after ESPN confirms the result. Analysis-only checks do not create empty commits.
