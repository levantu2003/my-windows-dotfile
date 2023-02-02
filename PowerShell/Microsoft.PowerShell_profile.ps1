#Aliases
Set-Alias tt tree
Set-Alias ll ls
Set-Alias g git
Set-Alias vim nvim

#Prompt
oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/craver.omp.json'| Invoke-Expression

#Functions
function whereis ($command) {
    Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}




#Terminal Icons
Import-Module Terminal-Icons
Set-PSReadLineKeyHandler -Key Tab -function Complete
Set-PSReadLineOption -PredictionViewStyle Listview
