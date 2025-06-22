# Streamlined PSReadLine configuration for faster startup
Set-PSReadLineOption -PredictionSource None -HistorySearchCursorMovesToEnd -MaximumHistoryCount 5000

# Essential PSReadLine colors (Catppuccin Mocha)
Set-PSReadLineOption -Colors @{
    Command          = '#89b4fa'
    Parameter        = '#fab387'
    String           = '#f9e2af'
    Variable         = '#a6e3a1'
    Comment          = '#6c7086'
}

# Essential key bindings only
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

# Function to install module if not present
function Install-ModuleIfNotExists {
    param([string]$ModuleName)
    if (-not (Get-Module -ListAvailable -Name $ModuleName)) {
        Install-Module -Name $ModuleName -Force -SkipPublisherCheck -Scope CurrentUser
    }
}

# Essential modules only
$essentialModules = @('Terminal-Icons', 'posh-git')
foreach ($module in $essentialModules) {
    Install-ModuleIfNotExists $module
}

# Import modules
Import-Module Terminal-Icons -ErrorAction SilentlyContinue
Import-Module posh-git -ErrorAction SilentlyContinue

# Environment variables
$env:BAT_THEME = "Catppuccin-mocha"
$env:EDITOR = "code"

# Navigation
function .. { Set-Location .. }
function ... { Set-Location ../.. }
function ~ { Set-Location $env:USERPROFILE }

# Directory listing
function l { Get-ChildItem @args | Format-Wide -AutoSize }
function ll { Get-ChildItem -Force @args | Format-Table -AutoSize }
function la { Get-ChildItem -Force @args }

# Git essentials
function g { git @args }
function gst { git status }
function gaa { git add --all }
function gc { git commit @args }
function gcm { git commit -m @args }
function gp { git pull }
function gpp { git push }
function gco { git checkout @args }
function gcb { git checkout -b @args }
function gl { git log --oneline --graph --decorate --all }

# Android development
function Get-AdbDevices { adb devices }
Set-Alias -Name adb-devices -Value Get-AdbDevices

# System utilities
function ff { fastfetch --config "$env:USERPROFILE\.config\fastfetch\config_icons.jsonc" }
function devinfo { 
    @{
        "OS" = (Get-CimInstance Win32_OperatingSystem).Caption
        "PowerShell" = $PSVersionTable.PSVersion.ToString()
        "Node.js" = if (Get-Command node -EA SilentlyContinue) { node --version } else { "Not installed" }
        "Git" = if (Get-Command git -EA SilentlyContinue) { git --version } else { "Not installed" }
    }.GetEnumerator() | Format-Table -AutoSize
}

# Oh-My-Posh Configuration
if (Get-Command oh-my-posh -ErrorAction SilentlyContinue) {
    $CUSTOM_THEME_PATH = "$env:USERPROFILE\.config\oh-my-posh\catppuccin_mocha_custom.omp.json"
    if (Test-Path $CUSTOM_THEME_PATH) {
        oh-my-posh init pwsh --config $CUSTOM_THEME_PATH | Invoke-Expression
    }
}

# Auto-run fastfetch on startup
if (Get-Command fastfetch -ErrorAction SilentlyContinue) {
    fastfetch --config "$env:USERPROFILE\.config\fastfetch\config_icons.jsonc"
}