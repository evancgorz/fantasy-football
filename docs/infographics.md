# Simple coaching infographics

Use one compact PNG for each verified ESPN move and meaningful matchup/weekly update. No visual is needed for an unchanged non-actionable check. Prefer a move summary, comparable projected totals, actual score with players remaining, or the next injury/lock check. Avoid decorative complexity or fabricated probabilities.

## Owner-facing tone: serious coaching, ridiculous briefing

Effective October 20, 2026, use deadpan, absurd satirical sports reporting for overview slides and infographic copy. The owner wants an apparently clueless front office backed by genuinely careful analysis. Favor mock bureaucracy, wildly disproportionate conclusions and self-deprecating coaching incompetence. Every ridiculous explanation needs an ounce of truth from the sourced analysis. Aim for a punchline for each major item, not merely a playful title followed by a conventional report. For example, a receiver with 15 targets can be described as "a man the football keeps trying to contact."

- This is a presentation layer only. Keep weekly analysis, structured decisions, evidence, replacement-value comparisons and executable handoffs literal and rigorous. Never select a player, invent a rationale or change risk tolerance to serve a joke.
- Scores, metric labels, projection/actual distinctions, costs, observed timestamps, transaction statuses and next checks stay accurate and readable. A proposed claim remains PROPOSED, not a satirical announcement of an acquisition. Do not invent quotations, statistics, sources, offers, medical details or guaranteed outcomes.
- Make the coach/front office the main butt of the joke. Do not ridicule serious illness, injury, suffering or family circumstances. Security/login failures and urgent owner actions get clear literal alerts, not comedy that conceals the required action.
- Label the overview briefly: "Satirical briefing | factual scores and status." Do not explain every punchline on the image. Include a `comedic_anchors` array in the curated JSON mapping each joke to its literal factual anchor and report reference; the renderer may ignore this audit metadata. Preserve the serious report alongside the visual.
- Use short, aggressively silly headlines and explanations, not dense paragraphs or generic inspirational sports copy. Broad deadpan parody is the reference, not copied headlines, branding or claims of affiliation with a publication.
- Reusing an older snapshot for a new presentation does not constitute a fresh ESPN check. Preserve original observation times, label it as a snapshot and keep the original factual visual when producing a satirical edition of a historical report.

All scheduled coaching runs read this file; apply this style without changing app automation definitions. Readability, sourcing, lock protection and Git archiving below still apply.

## Beginner accessibility: no football knowledge assumed

The owner knows nothing about football. Owner-facing slides and chat summaries must make sense without a glossary or player-name recognition. Keep the absurd humor, but make the factual setup understandable first.

- Lead with the consequence: "We won by 1.84 points" and "5 wins, 1 loss," not merely a score or "5-1." Briefly establish that real-game performance earns our fantasy team points when needed.
- For each item communicate **who / action / benefit**, then the joke. Identify a receiver as someone who catches passes, a kicker as someone who kicks the ball between the posts, and a defense as a group that stops the other team. Do not bury the reader in position lessons.
- Translate "targets" to "passes thrown his way" (not catches), "bye" to "scheduled week off," "waiver priority" to "our place in line to request available players," "start" to "put him in the scoring lineup," and "lock" to "deadline to change that player's lineup spot." Avoid unexplained WR, FLEX, IR, D/ST, PPR and team abbreviations in the overview. Operational records can retain precise terminology.
- Explain that only the scoring lineup earns points; players on our bench do not contribute to our weekly score. Distinguish adding someone to the team from putting him in that lineup. Explain planned versus completed in normal words even when renderer status labels already say PROPOSED or EXECUTED.
- Prefer one short factual setup plus one absurd punchline per item. Jokes should rely on everyday experiences (office work, shopping, vacations, breakfast), not football trivia. Do not replace jargon with equally mysterious metaphors.
- Keep the overview compact: result, up to three understandable changes, next check and whether the owner needs to do anything. Put statistical detail and secondary deadlines in the linked serious report rather than shrinking text or turning the slide into a rulebook. Retain any genuinely urgent deadline/action explicitly.
- Before rendering, ask: could someone who has never watched a game explain what we plan to do and why after reading this? Then inspect the rendered image for readability as usual.

## Rendering workflow

1. Curate minimal sourced values from the verified decision/report, not a raw authenticated export. Write `analysis/infographics/YYYY-week-NN-<run-or-action>.json` with apply_patch. Each metric has a label, numeric value (or null for unknown), kind (`projection` or `actual`), and its own observation timestamp with offset. Include source URLs/timestamps, move status, concise reason, next check and limitations. Mark historical snapshots explicitly; do not call them live.
2. Run `pwsh -NoProfile -File scripts/render-infographic.ps1 -InputPath analysis/infographics/<name>.json` with the configured PowerShell 7.5+ runtime on Windows. It creates a same-name PNG using built-in Windows drawing, no image-generation service or new credentials. Consult the Week 5 example for the input shape. Keep comparisons in the same kind/units; actual-versus-projected needs separate visuals. Cross-time projection bars are snapshots, not attribution of guaranteed gain. Do not change execution/security policies to run the renderer; report a limitation if the supported runtime is unavailable.
3. Inspect the PNG with view_image. Check labels, numbers, wrapping and source/caveat text. Fix the input and rerender if needed. Unknown is never zero. Never invent confidence scores, distributions or win probability. Displayed projection changes are not actual points gained; trade/claim submissions are pending until outcome verification.
4. Link input/PNG from the weekly report and relevant decision record. Include them with that action's verified log in its selective commit/push. Embed the absolute PNG path in the final response with a short takeaway, and link the input if detailed sources are useful. Do not put credentials, cookies, manager contact details or raw exports in either file.

An imminent lock takes precedence over graphics. After an ESPN mutation, verify and archive text/structured records even if rendering fails; report the limitation and add the visual in a separate repository-only commit. Do not make another ESPN mutation before the previous verified action has been pushed. Automated visual output is a summary, not authorization or a substitute for live ESPN checks. If the Windows renderer is unavailable, preserve sourced input and use a small text summary while reporting the visual limitation.

## Readability

Use short labels and at most six metrics, three moves and three notes. Provide a timestamp, explicit proposed/executed status, source names, and next check. The fixed-width output fits a compact briefing and scales in chat; full URLs remain in the input and report. Tests: `pwsh -NoProfile -File scripts/test-infographic.ps1`.
