### Hyprland configuration for NixOS with additional personal use case.

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

![screenshot](https://private-user-images.githubusercontent.com/176675781/435218767-caa6a4b5-84b6-4ff2-8ec8-e32962598429.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NDQ5ODcyNzgsIm5iZiI6MTc0NDk4Njk3OCwicGF0aCI6Ii8xNzY2NzU3ODEvNDM1MjE4NzY3LWNhYTZhNGI1LTg0YjYtNGZmMi04ZWM4LWUzMjk2MjU5ODQyOS5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjUwNDE4JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI1MDQxOFQxNDM2MThaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT01NjlhNTc3OTNkYTIzMjA5MTk2MGFkOTMzZDNlMzI1MTVjNzg0Y2RlYTBiYzg1YWYxZTRiYjQ2ZTRmNjkxMjQzJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.CAs5gjUfifAc4Am7hHkR7kPt3vMG_zbAq2US1OId13w)

---
### Changelogs:


## Ver. 3.6.4:

- Added K Desktop Enviroment

- Added Libre Office Fresh

## Ver. 3.6.3:

- Added extra infos for keybinds (workspaces, and windows management).

## Ver. 3.6.2:

- Removed 175MB of legacy configs, duplicate modules, and redundant scripts from original dotfiles.

- Rewrote  shell scripts to follow better logic flow, reduced LOC by 30–50% each.

- Removed directories and refactored  to reduce imports and creates consistent configs, reducing bloat and unify styling.

- NixOS icon on waybar now changes wallpaper randomly on click (SUPER + H still shows keybind hints).

- Added "bc" package for wallpaper script.

- Hyprland config file now has headers for easier navigation.
