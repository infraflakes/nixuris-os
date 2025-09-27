{
  config,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    direnv
  ];
  programs.git = {
    enable = true;
    userName = "nixuris";
    userEmail = "nixuriss@proton.me";
  };
  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        email = "nixuriss@proton.me";
        name = "nixuris";
      };
    };
  };
}
