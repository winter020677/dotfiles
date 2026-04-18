# Windows dotfiles setup script
# Run as Administrator

$DotfilesDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$WindowsDir = Join-Path $DotfilesDir "windows"

Write-Host "dotfiles setup start (Windows)"

function Backup-Path {
  param($Path)
  if ((Test-Path $Path) -and (-not (Get-Item $Path).LinkType)) {
    $BackupPath = "$Path.bak"
    Move-Item -Path $Path -Destination $BackupPath
    Write-Host "backup: $Path -> $BackupPath"
  }
}

# nvim
$NvimTarget = Join-Path $env:LOCALAPPDATA "nvim"
Backup-Path $NvimTarget
New-Item -ItemType Junction -Path $NvimTarget -Target (Join-Path $WindowsDir "nvim") -Force | Out-Null
Write-Host "junction: $NvimTarget -> $WindowsDir\nvim"

# wezterm
$WeztermTarget = Join-Path $env:USERPROFILE ".config\wezterm"
$WeztermParent = Split-Path $WeztermTarget
if (-not (Test-Path $WeztermParent)) { New-Item -ItemType Directory -Path $WeztermParent | Out-Null }
Backup-Path $WeztermTarget
New-Item -ItemType Junction -Path $WeztermTarget -Target (Join-Path $WindowsDir "wezterm") -Force | Out-Null
Write-Host "junction: $WeztermTarget -> $WindowsDir\wezterm"

# starship
$StarshipTarget = Join-Path $env:USERPROFILE ".config\starship.toml"
$StarshipParent = Split-Path $StarshipTarget
if (-not (Test-Path $StarshipParent)) { New-Item -ItemType Directory -Path $StarshipParent | Out-Null }
Backup-Path $StarshipTarget
New-Item -ItemType SymbolicLink -Path $StarshipTarget -Target (Join-Path $DotfilesDir "starship.toml") -Force | Out-Null
Write-Host "symlink: $StarshipTarget -> $DotfilesDir\starship.toml"

Write-Host "setup complete"
