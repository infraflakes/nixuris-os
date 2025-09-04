{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  buildInputs = with pkgs; [
    go
  ];
  shellHook = ''
    echo "Go environment is ready!"
    exec fish
  '';
}
