$env:nvim_appname = 'nvim'
$env:path += 'C:\sqlite-tools-win-x64-3460000;'
$env:path += 'C:\Program Files\Neovim\bin;'

function vim
{
    $env:nvim_appname = 'mynvim'
	nvim $args
}

function vi
{
    $env:nvim_appname = 'test'
    nvim $args
}

function prompt
{
    $value = Split-Path -Path (Get-Location) -Leaf
	$path = "`e[33m$value`e[0m"
	$username = "`e[32m$env:username`e[0m"
	$tilde = "`e[33m~`e[0m"
	# "$username at $path ~ "
	"at $path 🫵 "
}

function up () { cd ".." }

function lsf () { ls | findstr "$args" }
