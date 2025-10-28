{
  config,
  pkgs,
  ...
}:
{
  programs.direnv = {
    enable = true;
  };
  programs.git = {
    enable = true;
    settings.user = {
      email = "infraflakes@proton.me";
      name = "infraflakes";
    };
  };
  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        email = "infraflakes@proton.me";
        name = "infraflakes";
      };
    };
  };
}
