# oh-my-posh init pwsh | Invoke-Expression
# Import-Module posh-git
# Import-Module oh-my-posh
# Set-PoshPrompt Paradox
# oh-my-posh init pwsh --config "C:\Users\zekie\AppData\Local\Programs\oh-my-posh\themes\M365Princess.omp.json" | Invoke-Expression
# oh-my-posh init pwsh --config "C:\Users\zekie\AppData\Local\Programs\oh-my-posh\themes\night-owl.omp.json" | Invoke-Expression
# oh-my-posh init pwsh --config "C:\Users\zekie\AppData\Local\Programs\oh-my-posh\themes\jblab_2021.omp.json" | Invoke-Expression
# oh-my-posh init pwsh --config "C:\Users\zekie\src\oh-my-posh\sample.json" | Invoke-Expression


 oh-my-posh init pwsh --config "C:\Users\zekie\Documents\Powershell\takuya.omp.json" | Invoke-Expression
# oh-my-posh init pwsh --config "C:\Users\zekie\AppData\Local\Programs\oh-my-posh\themes\hunk.omp.json" | Invoke-Expression
Import-Module -Name Terminal-Icons

# ALIAS
function up () {cd ".."}
Set-Alias ll ls
Set-Alias g git
# Set-Alias vim nvim
# Set-Alias pas 'php artisan serve'
function nrd () { npm run dev}
function pas () { php artisan serve }

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}


Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'
# Dracula readline configuration. Requires version 2.0, if you have 1.2 convert to `Set-PSReadlineOption -TokenType`
Set-PSReadlineOption -Color @{
    "Command" = [ConsoleColor]::Green
    "Parameter" = [ConsoleColor]::Gray
    "Operator" = [ConsoleColor]::Magenta
    "Variable" = [ConsoleColor]::White
    "String" = [ConsoleColor]::Yellow
    "Number" = [ConsoleColor]::Blue
    "Type" = [ConsoleColor]::Cyan
    "Comment" = [ConsoleColor]::DarkCyan
}
# Dracula Prompt Configuration
Import-Module posh-git
$GitPromptSettings.DefaultPromptPrefix.Text = "$([char]0x2192) " # arrow unicode symbol
$GitPromptSettings.DefaultPromptPrefix.ForegroundColor = [ConsoleColor]::Green
$GitPromptSettings.DefaultPromptPath.ForegroundColor =[ConsoleColor]::Cyan
$GitPromptSettings.DefaultPromptSuffix.Text = "$([char]0x203A) " # chevron unicode symbol
$GitPromptSettings.DefaultPromptSuffix.ForegroundColor = [ConsoleColor]::Magenta
# Dracula Git Status Configuration
$GitPromptSettings.BeforeStatus.ForegroundColor = [ConsoleColor]::Blue
$GitPromptSettings.BranchColor.ForegroundColor = [ConsoleColor]::Blue
$GitPromptSettings.AfterStatus.ForegroundColor = [ConsoleColor]::Blue
