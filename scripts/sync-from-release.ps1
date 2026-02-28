param(
  [Parameter(Mandatory=$true)]
  [string]$ReleaseRepoPath
)

$source = Join-Path $ReleaseRepoPath ".github"
if (-not (Test-Path $source)) {
  throw "Release repo .github not found: $source"
}

if (Test-Path ".github") {
  Remove-Item ".github" -Recurse -Force
}

New-Item -ItemType Directory -Path ".github" | Out-Null
Copy-Item (Join-Path $source "*") ".github" -Recurse -Force
Write-Host "Synced .github from $ReleaseRepoPath"
