{
  config,
  pkgs,
  ...
}: let
  wantedFlatpaks = [
    "app.zen_browser.zen"
  ];
in {
  services.flatpak.enable = true;
  systemd.services.flatpak-setup = {
    description = "Add flathub repo and install requested Flatpak apps";
    wantedBy = ["multi-user.target"];
    after = ["network-online.target"];
    wants = ["network-online.target"];
    # Make sure we have flatpak in $PATH
    path = [pkgs.flatpak];

    # Run only once per system boot-up
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };

    script = ''
      set -euo pipefail

      # 1. Add Flathub (idempotent)
      flatpak remote-add --if-not-exists --system \
        flathub https://flathub.org/repo/flathub.flatpakrepo

      # 2. Install every app that is not already present
      ${pkgs.lib.concatMapStrings (app: ''
          flatpak install --system --assumeyes --noninteractive \
            flathub ${app} || true
        '')
        wantedFlatpaks}
    '';
  };
}
