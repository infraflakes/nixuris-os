{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  buildInputs = with pkgs; [
    go
    golangci-lint
  ];
  shellHook = ''
    go env -w GOPATH=$HOME/.local/share/go
      echo "Go environment is ready!"
      exec fish
  '';
}
