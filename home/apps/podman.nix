{
  config,
  pkgs,
  ...
}:
{
  services.podman = {
    enable = true;
    settings.registries.search = [
      "docker.io"
      "quay.io"
      "registry.fedoraproject.org"
      "https://mirror.gcr.io"
    ];
  };
}
