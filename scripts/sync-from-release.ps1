param(
  [Parameter(Mandatory=$true)]
  [string]$ReleaseRepoPath
)

$source = Join-Path $ReleaseRepoPath ".github"
if (-not (Test-Path $source)) {
  throw "Release repo .github not found: $source"
}

Get-ChildItem . -Force |
  Where-Object {
    $_.Name -ne ".git" -and
    $_.Name -ne "README.md" -and
    $_.Name -ne "scripts"
  } |
  ForEach-Object {
    Remove-Item $_.FullName -Recurse -Force
  }

Copy-Item (Join-Path $source "*") "." -Recurse -Force
Write-Host "Synced release .github content into copilot repo root from $ReleaseRepoPath"
