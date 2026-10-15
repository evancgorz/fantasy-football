param([string]$AutomationRoot = 'C:/Users/Evan Gorczynski/.codex/automations')
$ErrorActionPreference = 'Stop'
$snapshot = Get-Content (Join-Path $PSScriptRoot '../docs/automation-config.json') -Raw | ConvertFrom-Json
if (@($snapshot.automations).Count -ne 6) { throw 'Expected six saved tasks' }
if (@($snapshot.automations.id | Select-Object -Unique).Count -ne 6) { throw 'Duplicate IDs' }
foreach ($task in $snapshot.automations) {
    $text = Get-Content -LiteralPath (Join-Path $AutomationRoot ($task.id+'/automation.toml')) -Raw
    foreach ($field in @('id','kind','name','status','rrule','prompt','target_thread_id')) {
        $match = [regex]::Match($text,'(?m)^'+$field+' = (.+)$')
        if (-not $match.Success) { throw ('Missing field '+$field) }
        $actual = $match.Groups[1].Value | ConvertFrom-Json
        if ($actual -cne $task.$field) { throw ($task.id+' mismatch: '+$field) }
    }
    if ($task.kind -ne 'heartbeat' -or $task.status -ne 'ACTIVE' -or $task.target_thread_id -ne $snapshot.targetThreadId) { throw 'Wrong destination/status' }
    if ($text -match '(?m)^(model|reasoning_effort|execution_environment|target) =') { throw 'Unexpected standalone fields; verify actual runtime behavior' }
    foreach ($required in @('hands-off delegation','docs/infographics.md','BEFORE another mutation','ESPN READ-ONLY','platform-required','Do not spawn a separate chat')) {
        if ($required -eq 'ESPN READ-ONLY' -and $task.id -notin @('fantasy-weekly-review','thursday-lineup-check','monday-night-lineup-check')) { continue }
        if ($task.prompt -notmatch [regex]::Escape($required)) { throw ($task.id+' missing: '+$required) }
    }
    if ($task.prompt -match 'require owner input|request owner approval|Escalate close|only straightforward') { throw 'Stale strategic approval restriction' }
}
foreach ($file in Get-ChildItem -LiteralPath $AutomationRoot -Filter automation.toml -Recurse) {
    $text = Get-Content -LiteralPath $file.FullName -Raw
    if ($text -match 'kind = "cron"' -and $text -match 'status = "ACTIVE"' -and $text -match ('project_id = "'+[regex]::Escape($snapshot.projectId)+'"')) { throw 'Duplicate active standalone project task remains' }
}
if ($snapshot.requestedChatModel -ne 'gpt-6.1-sol' -or $snapshot.requestedChatReasoningEffort -ne 'medium') { throw 'Requested chat model changed' }
Write-Output 'PASS: six ACTIVE chat-attached tasks exactly match saved prompts/schedules/target; no active standalone duplicate. Model preference documented, not runtime-verified.'
