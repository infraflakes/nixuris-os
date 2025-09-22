{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [direnv codeblocks];
  programs.git = {
    enable = true;
    userName = "nixuris";
    userEmail = "nixuriss@proton.me";
  };
  #programs.jujutsu = {
  #enable = true;
  #settings = {
  #user = {
  #email = "nixuriss@proton.me";
  #name = "nixuris";
  #};
  #};
  #};

  programs.vscode = {
    enable = true;
    #package = pkgs.vscodium;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      #ms-python.python
      ms-vscode.cpptools
      ms-vscode-remote.remote-containers
      #llvm-vs-code-extensions.vscode-clangd
      github.github-vscode-theme
      bbenoist.nix
      mkhl.direnv
    ];
  };
  home.file.".config/Code/User/settings.json".source = ./config/Code/minimal-ui.json;
}
