### Personal flakes for NixOS setup. (ASUS FX507ZU4)

> [!CAUTION] 

> flake.nix acts as a replacement for home.nix and configuration.nix!

> Nix files in modules directory are systemwide configurations (asusctl, bootloader, fonts, timezones, users, etc....) and the ones in modules/home directory are my dotfiles config.

> I suggest looking into modules/home/hypr.nix to see what needs to be installed if you only want to use my hyprland dots and the scripts. 

> Since this is a personal configuration. I recommend looking into flake.nix to change "nixuris" to your preferred username, change to your preferred channel (default is unstable), change "nixos" to your actual hostname (find it using the command 'hostname') and looking into home.packages as well as modules/sys.nix to see what packages will be installed! 

> Also check the graphics.nix in the same directory to modify according to your setup assuming its not NVIDIA hybrid with Intel.

> The default shell in this setup is fish and the default editor is neovim. 

> NeoVim will use the config in resources/nvim as default so change that if you want. If you want to use my nvim config, I suggest using my shell.nix at the first neovim activation for the sake of simplicity to provide the necessary components to set it up (or provide it with any other way).

> If you want to use my wallpaper changing script (SUPER + SHIFT + W) I suggest you put the wallpapers in 'pics' directory or change it in scripts/wallselect to your preferred location.

### How to install!

Clone my repo!

```
git clone https://github.com/nixuris/hyprnix.git
```

Copy your hardware-configuration in!

```
cd hyprnix
rm modules/hardware-configuration.nix
sudo cp /etc/nixos/hardware-configuration.nix modules
```

You may edit the configurations as stated in the caution and build it!

```
sudo nixos-rebuild switch --flake .#nixos
```

Assuming you're in the same directory as flake.nix and your hostname is 'nixos'.

---
### Changelogs:

## Ver. 5.2.6:

- Remove configuration.nix and home.nix to use flake instead! Convert the dotfiles and apps to use home manager.

- Rework repo structure completely.

- Unified system configurations logically.

- Waybar now has 2 bars (to prevent modules overcrowding).

- Most packages now installed using home manager.

## Ver. 4.7.1:

- Changing zsh's config location.

- Optimized theming with Home manager.

- Optimized configuration.nix for less redunancy.

- IMV now is the default image viewer.

## Ver. 4.6.5:

- Fixing keybind hint list! (SUPER + H to open)

- Removed obsolete keybinds!

## Ver. 4.6.3:

- Added shell.nix with zsh config!

- Debloated configuration.nix!

- Restructured directory!

## Ver. 4.3.12:

- Alacritty is now the default terminal.

- Rofi is now interactive with mouse.

- New session management menu using rofi and bash.

- Removed deprecated keybinds, adding borders for windows and adding new keybinding for notification center.

- Added new power option for waybar.

- Added new spicetify theme inspired by spotify-tui with system color palette.

- Modify alacritty and rofi color palette to match system.

- Update dunst config.

- Change fastfetch OS icon.

- Modify fish shell aliases to manage system.

- Added GTK user env.

- Removed display manager, black listed kvm modules, remove xserver, bluetooth, open tablet driver, power management tools, supergfxctl.

- Disabled avahi, some network manager services, firewall and accounts daemon.

- Removed flatpak, gnome.

- Removed gaming utilities.

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
