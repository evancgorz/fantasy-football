param([Parameter(Mandatory=$true)][string]$InputPath)
$ErrorActionPreference = 'Stop'
$data = Get-Content -LiteralPath $InputPath -Raw | ConvertFrom-Json -DateKind String
function Check-Time([string]$value) {
    if ($value -notmatch '^\d{4}-\d{2}-\d{2}T.+(Z|[+-]\d{2}:\d{2})$') { throw 'Timestamp must include offset' }
    [void][DateTimeOffset]::Parse($value)
}
if ([string]::IsNullOrWhiteSpace($data.title) -or $data.title.Length -gt 65) { throw 'Short title required' }
Check-Time $data.observed_at
if (-not $data.disclaimer -or @($data.sources).Count -lt 1) { throw 'Sources and disclaimer required' }
if (@($data.metrics).Count -gt 6 -or @($data.moves).Count -gt 3 -or @($data.notes).Count -gt 3) { throw 'Too many items' }
$kinds = @($data.metrics | ForEach-Object { $_.kind } | Select-Object -Unique)
if ($kinds.Count -gt 1) { throw 'Do not mix actuals and projections on one chart' }
foreach ($metric in $data.metrics) {
    if (-not $metric.label -or $metric.kind -notin @('actual','projection')) { throw 'Metric label/kind required' }
    Check-Time $metric.observed_at
    if ($null -ne $metric.value) {
        if ($metric.value -is [string] -or $metric.value -is [bool] -or [double]::IsNaN([double]$metric.value) -or [double]::IsInfinity([double]$metric.value)) { throw 'Finite numeric metric or null required' }
    }
}
foreach ($source in $data.sources) {
    if (-not $source.label -or $source.url -notmatch '^https://') { throw 'Source label/URL required' }
    Check-Time $source.observed_at
}
foreach ($move in $data.moves) {
    if (-not $move.label -or -not $move.reason -or $move.status -notin @('executed','proposed','pending','retained')) { throw 'Move label/reason/status required' }
}
Add-Type -AssemblyName System.Drawing
$bitmap = New-Object System.Drawing.Bitmap 900,1400
$graphics = [System.Drawing.Graphics]::FromImage($bitmap)
$graphics.Clear([System.Drawing.ColorTranslator]::FromHtml('#102431'))
$graphics.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::AntiAliasGridFit
$white = New-Object System.Drawing.SolidBrush ([System.Drawing.ColorTranslator]::FromHtml('#f3f6f7'))
$muted = New-Object System.Drawing.SolidBrush ([System.Drawing.ColorTranslator]::FromHtml('#b8cbd4'))
$accent = New-Object System.Drawing.SolidBrush ([System.Drawing.ColorTranslator]::FromHtml('#6edab8'))
$track = New-Object System.Drawing.SolidBrush ([System.Drawing.ColorTranslator]::FromHtml('#294555'))
$heading = New-Object System.Drawing.Font 'Segoe UI',26,([System.Drawing.FontStyle]::Bold)
$normal = New-Object System.Drawing.Font 'Segoe UI',17
$small = New-Object System.Drawing.Font 'Segoe UI',13
$script:y = 32
function Text-Line([string]$text, $font, $brush) {
    $size = $graphics.MeasureString($text,$font,820)
    $graphics.DrawString($text,$font,$brush,[System.Drawing.RectangleF]::new(40,$script:y,820,$size.Height+5))
    $script:y += [int][Math]::Ceiling($size.Height)+12
}
try {
    Text-Line $data.title $heading $white
    Text-Line $data.subtitle $normal $muted
    Text-Line ('Snapshot: '+$data.observed_at) $small $muted
    $values = @($data.metrics | Where-Object { $null -ne $_.value } | ForEach-Object { [double]$_.value })
    $minimum = 0.0; $maximum = 1.0
    foreach ($value in $values) { $minimum = [Math]::Min($minimum,$value); $maximum = [Math]::Max($maximum,$value) }
    foreach ($metric in $data.metrics) {
        $display = 'unknown'
        if ($null -ne $metric.value) { $display = ([double]$metric.value).ToString('0.0',[Globalization.CultureInfo]::InvariantCulture)+' pts' }
        Text-Line ($metric.label+'  |  '+$display+' '+$metric.kind) $normal $white
        if ($null -ne $metric.value) {
            $graphics.FillRectangle($track,40,$script:y,820,14)
            $zero = 40 + 820*(0-$minimum)/($maximum-$minimum)
            $endpoint = 40 + 820*([double]$metric.value-$minimum)/($maximum-$minimum)
            $graphics.FillRectangle($accent,[single][Math]::Min($zero,$endpoint),$script:y,[single][Math]::Abs($endpoint-$zero),14)
            $script:y += 26
        }
    }
    foreach ($move in $data.moves) {
        $script:y += 10
        Text-Line ($move.status.ToUpperInvariant()+'  |  '+$move.label) $normal $white
        Text-Line $move.reason $small $muted
    }
    foreach ($note in $data.notes) { Text-Line $note $small $muted }
    Text-Line $data.disclaimer $small $muted
    Text-Line ('Sources: '+(($data.sources | ForEach-Object { $_.label }) -join '; ')) $small $muted
    if ($script:y -gt 1380) { throw 'Content too tall: shorten notes/labels' }
    $crop = $bitmap.Clone([System.Drawing.Rectangle]::new(0,0,900,($script:y+20)),$bitmap.PixelFormat)
    try {
        $output = [IO.Path]::ChangeExtension([IO.Path]::GetFullPath($InputPath),'.png')
        $crop.Save($output,[System.Drawing.Imaging.ImageFormat]::Png)
        Write-Output $output
    } finally { $crop.Dispose() }
} finally {
    $graphics.Dispose(); $bitmap.Dispose()
    foreach ($resource in @($white,$muted,$accent,$track,$heading,$normal,$small)) { $resource.Dispose() }
}
