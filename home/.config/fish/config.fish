if status is-interactive
    fastfetch
    export EDITOR="nvim"
    export VISUAL="nvim"
    fish_add_path .local/bin
    fish_add_path .cargo/bin

end
