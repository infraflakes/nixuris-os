{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  buildInputs = with pkgs; [
    ninja
    cmake
    gdb
    gcc
    clang-tools
  ];
  shellHook = ''
    exec fish
  '';
}
