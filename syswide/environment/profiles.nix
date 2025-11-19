{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  environment.loginShellInit = ''
    tmux new-session -d -s default 2>/dev/null || true
  '';
  services.displayManager.gdm = {
    enable = true;
    wayland = true;
  };
  programs.uwsm = {
    enable = true;
    waylandCompositors = {
      # mango = {
      #   prettyName = "MangoWC";
      #   comment = "Mango compositor managed by UWSM";
      #   binPath = "${inputs.mangowc.packages.${pkgs.stdenv.hostPlatform.system}.default}/bin/mango";
      # };
      niri = {
        prettyName = "Niri";
        comment = "Niri compositor managed by UWSM";
        binPath = "${pkgs.niri}/bin/niri-session";
      };
    };
  };
}
