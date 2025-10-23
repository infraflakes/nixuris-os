{
  config,
  pkgs,
  ...
}:
{
  programs.bash = {
    enable = true;
    initExtra = ''
      if uwsm check may-start && uwsm select; then
        exec uwsm start default
      fi
    '';
  };
}
