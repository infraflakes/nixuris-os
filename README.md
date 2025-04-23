### Hyprland configuration for NixOS with additional personal use case.

> [!CAUTION] 
> I suggest looking into nixos/user/env/hyprland.nix to see what needs to be installed if you want to implement it yourself!
> Since this is a personal configuration, if you want to use my gtk settings in home-manager, remember to change to your name and the version to your system version!

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
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
home-manager switch
```

If the shell shows weird characters like '5u' then execute this command:

```
set -Ux fish_features no-keyboard-protocols
```

---
### Changelogs:

## Ver. 3.12.8:

- Now using swaync for notification management instead of dunst!

- New Cava module using custom cava script for waybar!

- Added Gnome with custom extensions, debloated package list and dconf-editor!

- Amoury Crate button now initiates rog-control-center.

- Home manager now follows same version as nixpkgs, replace Adwaita-dark with Catppuccin Frappe Blue as gtk theme!

- Change Alt + Delete to Super + Delete to delete one entry in clipboard manager.

- Brightness and volume script now uses ubuntu plug in to eliminate duplications on notification.

- Removed GameScope and other gaming peripherals.

- Better clarity in apps.nix.

- Removed KDE.

- Fixing wrong home manager channel for nixos unstable in README.

## Ver. 3.8.3:

- Added Java for development.

- Added Bottles to run windows apps.

## Ver. 3.8.2:

- SUPER + A to show window switcher!

- Changing brightness now show its state in notification!

- Fixed some deprecated paths on scripts.

- Removed some unnecessary config lines in rofi config.

## Ver. 3.6.7:

- Removed some wallpapers.

## Ver. 3.6.6:

- Using NVIDIA Open Source Kernel Module instead of the proprietary one.

## Ver. 3.6.5:

- Change wallpaper tracking path to a more logical directory.

- Extra infos of packages in hyprland.nix!

## Ver. 3.6.4:

- Added K Desktop Enviroment

- Added Libre Office Fresh

## Ver. 3.6.3:

- Added extra infos for keybinds (workspaces, and windows management).

## Ver. 3.6.2:

- Removed 412MB of legacy configs, duplicate modules, obsolete binary files, and redundant scripts from original dotfiles.

- Rewrote  shell scripts to follow better logic flow, reduced LOC by 30–50% each.

- Removed directories and refactored  to reduce imports and creates consistent configs, reducing bloat and unify styling.

- NixOS icon on waybar now changes wallpaper randomly on click (SUPER + H still shows keybind hints).

- Added "bc" package for wallpaper script.

- Hyprland config file now has headers for easier navigation.
