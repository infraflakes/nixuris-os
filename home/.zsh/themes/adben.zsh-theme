#!/usr/bin/env zsh
########## COLOR ###########
for COLOR in CYAN WHITE YELLOW MAGENTA BLACK BLUE RED DEFAULT GREEN GREY; do
  typeset -g PR_$COLOR="%b%{$fg[${(L)COLOR}]%}"
  typeset -g PR_BRIGHT_$COLOR="%B%{$fg[${(L)COLOR}]%}"
done
PR_RESET="%{$reset_color%}"

RED_START="${PR_GREY}<${PR_RED}<${PR_BRIGHT_RED}<${PR_RESET} "
RED_END="${PR_BRIGHT_RED}>${PR_RED}>${PR_GREY}>${PR_RESET} "
GREEN_START="${PR_GREY}>${PR_GREEN}>${PR_BRIGHT_GREEN}>${PR_RESET}"
GREEN_END="${PR_BRIGHT_GREEN}>${PR_GREEN}>${PR_GREY}>${PR_RESET} "
  # Make sure to quote % so that they're not expanded by the prompt
  echo -n "${header:gs/%/%%}"
}

# Context: user@directory or just directory
prompt_context() {
    echo -n "${PR_RESET}${PR_BLUE}nix-shell"
}

# Required for the prompt
setopt prompt_subst
# Prompt: header, context (user@host), directory
PROMPT="${RED_START}\$(prompt_context)${PR_BRIGHT_YELLOW}%~${PR_RESET}
${GREEN_START} "
# Right prompt: vcs status + time
RPROMPT="${PR_YELLOW}%D{%R.%S %a %b %d %Y} ${GREEN_END}"
# Matching continuation prompt
PROMPT2="${GREEN_START} %_ ${GREEN_START} "
