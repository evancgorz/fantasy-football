param([string]$AutomationRoot = 'C:/Users/Evan Gorczynski/.codex/automations')
$ErrorActionPreference = 'Stop'
$snapshot = Get-Content (Join-Path $PSScriptRoot '../docs/automation-config.json') -Raw | ConvertFrom-Json
if (@($snapshot.automations).Count -ne 6) { throw 'Expected six saved tasks' }
foreach ($task in $snapshot.automations) {
    $text = Get-Content -LiteralPath (Join-Path $AutomationRoot ($task.id+'/automation.toml')) -Raw
    foreach ($field in @('id','name','status','rrule','model','reasoning_effort','prompt')) {
        $match = [regex]::Match($text,'(?m)^'+$field+' = (.+)$')
        if (-not $match.Success) { throw ('Missing field '+$field) }
        $actual = $match.Groups[1].Value | ConvertFrom-Json
        if ($actual -cne $task.$field) { throw ($task.id+' mismatch: '+$field) }
    }
    if ($task.model -ne 'gpt-6.1-sol' -or $task.reasoning_effort -ne 'medium' -or $task.status -ne 'ACTIVE') { throw 'Model/status changed' }
    if ($text -notmatch 'execution_environment = "local"' -or $text -notmatch ('project_id = "'+[regex]::Escape($snapshot.projectId)+'"')) { throw 'Execution target changed' }
    foreach ($required in @('hands-off delegation','docs/infographics.md','BEFORE another mutation','ESPN READ-ONLY','platform-required')) {
        # Only weekly and preflight tasks require the read-only marker.
        if ($required -eq 'ESPN READ-ONLY' -and $task.id -notin @('fantasy-weekly-review','thursday-lineup-check','monday-night-lineup-check')) { continue }
        if ($task.prompt -notmatch [regex]::Escape($required)) { throw ($task.id+' missing: '+$required) }
    }
    if ($task.prompt -match 'require owner input|request owner approval|Escalate close|only straightforward') { throw 'Stale strategic approval restriction' }
}
Write-Output 'PASS: all six app definitions match repository snapshot, delegated authority/visuals, preserved model/status/target/read-only scopes.'
