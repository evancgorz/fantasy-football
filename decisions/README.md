# Structured decision records

Use docs/templates/decision-record.json; examples are pending recommendations, not ESPN actions. Keep one uniquely named JSON file per material decision. Do not store credentials or raw page exports.

Statuses: proposed, awaiting_owner, monitoring, submitted, completed, rejected, superseded, expired, blocked. Categories: lineup, waiver, add_drop, retain, trade, access. Sources contain url, observed_at, and a brief supported fact. Alternatives contain player/action and supporting evidence. Unknown numeric values are null, never zero.

Completed ESPN actions require non-null verification containing observed_at, ESPN URL, and persisted result. Submitted waiver claims stay submitted until processing verifies the outcome. Decision-time rationale and expected benefit are preserved when outcome is added. Each report links its records; consumer runs refresh facts before execution. Expired deadlines prohibit execution, not investigation of a missed opportunity.
