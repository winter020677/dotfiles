# Windows 用 dotfiles セットアップスクリプト
# 管理者権限で実行してください

$DotfilesDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$WindowsDir = Join-Path $DotfilesDir "windows"

Write-Host "dotfiles セットアップ開始 (Windows)"

# バックアップ関数
function Backup-Path {
  param($Path)
  if ((Test-Path $Path) -and (-not (Get-Item $Path).LinkType)) {
    $BackupPath = "$Path.bak"
    Move-Item -Path $Path -Destination $BackupPath
    Write-Host "バックアップ: $Path -> $BackupPath"
  }
}

# nvim ($env:LOCALAPPDATA\nvim)
$NvimTarget = Join-Path $env:LOCALAPPDATA "nvim"
Backup-Path $NvimTarget
New-Item -ItemType Junction -Path $NvimTarget -Target (Join-Path $WindowsDir "nvim") -Force | Out-Null
Write-Host "ジャンクション作成: $NvimTarget -> $WindowsDir\nvim"

# wezterm ($env:USERPROFILE\.config\wezterm)
$WeztermTarget = Join-Path $env:USERPROFILE ".config\wezterm"
$WeztermParent = Split-Path $WeztermTarget
if (-not (Test-Path $WeztermParent)) { New-Item -ItemType Directory -Path $WeztermParent | Out-Null }
Backup-Path $WeztermTarget
New-Item -ItemType Junction -Path $WeztermTarget -Target (Join-Path $WindowsDir "wezterm") -Force | Out-Null
Write-Host "ジャンクション作成: $WeztermTarget -> $WindowsDir\wezterm"

Write-Host "セットアップ完了"
