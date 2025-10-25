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
    userName = "infraflakes";
    userEmail = "infraflakes@proton.me";
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
