{
  config,
  pkgs,
  ...
}:
let
  cli = ./cli;
  dev = ./cli/dev;
  media = ./media;
in
{
  imports = [
    # CLI
    (cli + "/file-manager.nix")
    (cli + "/nvim.nix")

    # Dev
    (dev + "/vcs.nix")
    (dev + "/tmux.nix")
    (dev + "/podman.nix")

    # Media
    (media + "/media.nix")
    (media + "/misc.nix")
    (media + "/social.nix")
    (media + "/vpn.nix")
  ];
}
