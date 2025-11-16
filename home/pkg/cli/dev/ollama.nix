{
  config,
  pkgs,
  ...
}: let
  nvidia = "cuda";
  amd = "rocm";
in {
  home.packages = [
    (pkgs.ollama.override {
      acceleration = nvidia;
    })
  ];
}
