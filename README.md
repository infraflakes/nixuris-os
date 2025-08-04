### Personal flakes for NixOS setup. (ASUS FX507ZU4)

### CAUTION!

- Nix files in `syswide` directory are system-wide configurations (asusctl, bootloader, fonts, timezones, users, etc....) and the ones in `home` directory are home manager explicit options.

- Make sure you still have hardware-configuration.nix in /etc/nixos!

### How to install!

Clone the repo:

```
git clone https://github.com/nixuris/serein-nix.git
```

Apply changes system wide:

```
cd serein-nix
sudo nixos-rebuild switch --impure --flake .#nixos
```

Assuming your hostname is 'nixos'.

Then set up home manager:

```
home-manager switch --flake .#nixuris@nixos
```

Assuming username is 'nixuris'.

---
