{
  config,
  lib,
  pkgs,
  ...
}:
{
  users.users.nixuris.extraGroups = [ "docker" ];
  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
      daemon.settings = {
        dns = [
          "1.1.1.1"
          "8.8.8.8"
        ];
        registry-mirrors = [
          "https://mirror.gcr.io"
          "docker.io"
          "quay.io"
          "registry.fedoraproject.org"
        ];
      };
    };
  };
}
