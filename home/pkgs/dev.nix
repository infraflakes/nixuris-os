{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [gitui direnv];
  programs.git = {
    enable = true;
    userName = "nixuris";
    userEmail = "nixuriss@proton.me";
  };
  programs.vscode = {
    enable = true;
    #package = pkgs.vscodium;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      ms-python.python
      ms-vscode.cpptools
      #llvm-vs-code-extensions.vscode-clangd
      github.github-vscode-theme
      bbenoist.nix
      mkhl.direnv
    ];
  };
  home.file.".config/Code/User/settings.json".source = ./config/Code/minimal-ui.json;
}
