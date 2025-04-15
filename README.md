Hyprland configuration for NixOS with additional personal use case.

Remember to add channel for home-manager and the nixos channel by choice (ex. unstable):

```
sudo nix-channel --add https://channels.nixos.org/nixos-unstable nixos
```
And build it:

```
sudo nixos-rebuild switch --upgrade
```

Then add channel for home manager for nvim and gtk theme management:

```
nix-channel --add https://github.com/nix-community/home-manager/archive/release-24.11.tar.gz home-manager
nix-channel --update
home-manager switch
```

If the shell shows weird characters like '5u' then execute this command:

```
set -Ux fish_features no-keyboard-protocols
```
