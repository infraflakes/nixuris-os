{
  config,
  pkgs,
  ...
}: {
  programs.direnv = {
    enable = true;
  };
  programs.diff-so-fancy = {
    enable = true;
    enableGitIntegration = true;
  };
  programs.git = {
    enable = true;
    settings = {
      user = {
        email = "infraflakes@proton.me";
        name = "infraflakes";
      };
      color.diff = {
        meta = "blue";
        frag = "brightyellow";
        old = "red";
        new = "green";
      };
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
