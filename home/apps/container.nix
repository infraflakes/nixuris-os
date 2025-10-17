{
  config,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    podman
  ];
  home.file.".config/containers/policy.json".text = ''
    {
      "default": [{ "type": "insecureAcceptAnything" }]
    }
  '';
  home.file.".config/containers/registries.conf".text = ''
    unqualified-search-registries = ["docker.io", "quay.io", "registry.fedoraproject.org"]
  '';
}
