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
nix-channel --add https://github.com/nix-community/home-manager/archive/release-24.11.tar.gz home-manager
nix-channel --update
home-manager switch
```

If the shell shows weird characters like '5u' then execute this command:

```
set -Ux fish_features no-keyboard-protocols
```

![screenshot](https://private-user-images.githubusercontent.com/176675781/435218767-caa6a4b5-84b6-4ff2-8ec8-e32962598429.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NDQ5ODcyNzgsIm5iZiI6MTc0NDk4Njk3OCwicGF0aCI6Ii8xNzY2NzU3ODEvNDM1MjE4NzY3LWNhYTZhNGI1LTg0YjYtNGZmMi04ZWM4LWUzMjk2MjU5ODQyOS5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjUwNDE4JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI1MDQxOFQxNDM2MThaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT01NjlhNTc3OTNkYTIzMjA5MTk2MGFkOTMzZDNlMzI1MTVjNzg0Y2RlYTBiYzg1YWYxZTRiYjQ2ZTRmNjkxMjQzJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.CAs5gjUfifAc4Am7hHkR7kPt3vMG_zbAq2US1OId13w)

![screenshot](https://private-user-images.githubusercontent.com/176675781/435219052-573c29fc-e5f2-40cc-9cf1-79e2e260e16c.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NDQ5ODc0MzMsIm5iZiI6MTc0NDk4NzEzMywicGF0aCI6Ii8xNzY2NzU3ODEvNDM1MjE5MDUyLTU3M2MyOWZjLWU1ZjItNDBjYy05Y2YxLTc5ZTJlMjYwZTE2Yy5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjUwNDE4JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI1MDQxOFQxNDM4NTNaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT03NmMxODEwZGIwYTE1ZjRlNGFiM2FkYzcyZTlmM2RjMjFjNWY3MTk3NTNiMjFlOTAwNzVmNzUxYTFmZjMyZTgzJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.DCm4eW8rYX-EllmJYg2rfdBDjy_NHcHHQKrF7kS1OJs)

![wallpaper-picker](https://private-user-images.githubusercontent.com/176675781/435219246-b9e9bd97-9316-45d2-9af1-a885b7fb5da6.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NDQ5ODc0NTUsIm5iZiI6MTc0NDk4NzE1NSwicGF0aCI6Ii8xNzY2NzU3ODEvNDM1MjE5MjQ2LWI5ZTliZDk3LTkzMTYtNDVkMi05YWYxLWE4ODViN2ZiNWRhNi5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjUwNDE4JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI1MDQxOFQxNDM5MTVaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT0xMzViNDVlN2NkZDY4OGU3ODk1YjZkNmM1NjUxMDEyYTk0MDM0ZmQ0ZWY4ZjQ5NzhlNzFlYzg4MmUzNDAwODc0JlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.nx8Eub9xwKCM7ELJgraAx88dF00wpZqigbC9qrbUBjQ)

![app-launcher](https://private-user-images.githubusercontent.com/176675781/435219293-76c3df82-c698-4145-a477-aa105a72b817.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NDQ5ODc0NTUsIm5iZiI6MTc0NDk4NzE1NSwicGF0aCI6Ii8xNzY2NzU3ODEvNDM1MjE5MjkzLTc2YzNkZjgyLWM2OTgtNDE0NS1hNDc3LWFhMTA1YTcyYjgxNy5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjUwNDE4JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI1MDQxOFQxNDM5MTVaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT1iZTU1ZjdhYjZjMjFiZmYwNjBjNTQyZDMxNTRiNDdlNmVlZjAzY2FlMWM3YzNmNWQzYjE1NDllN2E4Njk5Y2NjJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.OWnvw_sV9uTo3Dx_hFzyFVcj7xr10Kftf9wYRK6BuiE)

---
### Changelogs:

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
