# Simple coaching infographics

Use one compact PNG for each verified ESPN move and meaningful matchup/weekly update. No visual is needed for an unchanged non-actionable check. Prefer a move summary, comparable projected totals, actual score with players remaining, or the next injury/lock check. Avoid decorative complexity or fabricated probabilities.

## Workflow

1. Curate minimal sourced values from the verified decision/report, not a raw authenticated export. Write `analysis/infographics/YYYY-week-NN-<run-or-action>.json` with apply_patch. Each metric has a label, numeric value (or null for unknown), kind (`projection` or `actual`), and its own observation timestamp with offset. Include source URLs/timestamps, move status, concise reason, next check and limitations. Mark historical snapshots explicitly; do not call them live.
2. Run `pwsh -NoProfile -File scripts/render-infographic.ps1 -InputPath analysis/infographics/<name>.json` with the configured PowerShell 7.5+ runtime on Windows. It creates a same-name PNG using built-in Windows drawing, no image-generation service or new credentials. Consult the Week 5 example for the input shape. Keep comparisons in the same kind/units; actual-versus-projected needs separate visuals. Cross-time projection bars are snapshots, not attribution of guaranteed gain. Do not change execution/security policies to run the renderer; report a limitation if the supported runtime is unavailable.
3. Inspect the PNG with view_image. Check labels, numbers, wrapping and source/caveat text. Fix the input and rerender if needed. Unknown is never zero. Never invent confidence scores, distributions or win probability. Displayed projection changes are not actual points gained; trade/claim submissions are pending until outcome verification.
4. Link input/PNG from the weekly report and relevant decision record. Include them with that action's verified log in its selective commit/push. Embed the absolute PNG path in the final response with a short takeaway, and link the input if detailed sources are useful. Do not put credentials, cookies, manager contact details or raw exports in either file.

An imminent lock takes precedence over graphics. After an ESPN mutation, verify and archive text/structured records even if rendering fails; report the limitation and add the visual in a separate repository-only commit. Do not make another ESPN mutation before the previous verified action has been pushed. Automated visual output is a summary, not authorization or a substitute for live ESPN checks. If the Windows renderer is unavailable, preserve sourced input and use a small text summary while reporting the visual limitation.

## Readability

Use short labels and at most six metrics, three moves and three notes. Provide a timestamp, explicit proposed/executed status, source names, and next check. The fixed-width output fits a compact briefing and scales in chat; full URLs remain in the input and report. Tests: `pwsh -NoProfile -File scripts/test-infographic.ps1`.
