{
  config,
  pkgs,
  ...
}: let
  nvidia = "cuda";
  amd = "rocm";
in {
  services.ollama = {
    enable = true;
    acceleration = nvidia;
  };
}
