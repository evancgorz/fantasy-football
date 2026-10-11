$ErrorActionPreference = 'Stop'
$renderer = Join-Path $PSScriptRoot 'render-infographic.ps1'
$fixture = Get-Content (Join-Path $PSScriptRoot '../analysis/infographics/2026-week-05-morning-moves.json') -Raw
$testDir = Join-Path ([IO.Path]::GetTempPath()) ('fantasy-visual-test-'+[Guid]::NewGuid().ToString('N'))
[void](New-Item -ItemType Directory -Path $testDir)
function Test-Rejected($data,[string]$name) {
    $testFile = Join-Path $testDir ($name+'.json')
    $data | ConvertTo-Json -Depth 8 | Set-Content -LiteralPath $testFile
    $rejected = $false
    try { & $renderer -InputPath $testFile | Out-Null } catch { $rejected = $true }
    if (-not $rejected) { throw ('Invalid fixture accepted: '+$name) }
}
$goodFile = Join-Path $testDir 'good.json'
$fixture | Set-Content -LiteralPath $goodFile
$output = & $renderer -InputPath $goodFile
if (-not (Test-Path -LiteralPath $output)) { throw 'No PNG generated' }
$image = [System.Drawing.Image]::FromFile($output)
try { if ($image.Width -ne 900 -or $image.Height -gt 1400) { throw 'Bad dimensions' } } finally { $image.Dispose() }
$data = $fixture | ConvertFrom-Json -DateKind String; $data.metrics[0].value = $null
$data.metrics[1].value = -2.0
$data | ConvertTo-Json -Depth 8 | Set-Content -LiteralPath (Join-Path $testDir 'unknown-negative.json')
& $renderer -InputPath (Join-Path $testDir 'unknown-negative.json') | Out-Null
$data = $fixture | ConvertFrom-Json -DateKind String; $data.metrics[0].kind = 'actual'; Test-Rejected $data 'mixed-kind'
$data = $fixture | ConvertFrom-Json -DateKind String; $data.metrics[0].value = 'invented'; Test-Rejected $data 'non-numeric'
$data = $fixture | ConvertFrom-Json -DateKind String; $data.observed_at = '2026-10-11'; Test-Rejected $data 'missing-offset'
$data = $fixture | ConvertFrom-Json -DateKind String; $data.sources = @(); Test-Rejected $data 'no-source'
Write-Output ('PASS: valid render, null/negative scores, mixed kinds, numeric validation, offsets, sources. Test artifacts: '+$testDir)
