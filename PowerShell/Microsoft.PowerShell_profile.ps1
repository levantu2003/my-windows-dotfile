#Aliases
Set-Alias t tree
Set-Alias ll ls
Set-Alias g git
Set-Alias v nvim

function gitclone
{
	& git clone $args
}
Set-Alias -Name gclone -Value gitclone 

function gitadd
{
	& git add .
}
Set-Alias -Name gadd -Value gitadd

function gitcommit
{
	& git commit -m $args
}
Set-Alias -Name gcommit -Value gitcommit

function gitpush
{
	& git push
}
Set-Alias -Name gpush -Value gitpush

#Prompt
oh-my-posh init pwsh --config '~/Documents/PowerShell/nord.json'| Invoke-Expression

#Functions
function whereis ($command) {
    Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

#Terminal Icons
Import-Module Terminal-Icons
Set-PSReadLineKeyHandler -Key Tab -function Complete
Set-PSReadLineOption -PredictionViewStyle Listview
