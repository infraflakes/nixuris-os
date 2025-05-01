# Based on bira zsh theme with nvm, rvm and jenv support
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

local user_host='%{$terminfo[bold]$fg[green]%}%n@%m%{$reset_color%}'
local current_dir='%{$terminfo[bold]$fg[red]%} %~%{$reset_color%}'
local nix='%{$terminfo[bold]$fg[green]%}nix-shell%{$reset_color%}'


PROMPT="╭─${nix} ${current_dir} 
╰─⚡ "
RPS1="${return_code}"


