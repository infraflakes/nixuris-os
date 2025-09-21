{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  buildInputs = with pkgs; [
    gcc
    gdb
    clang-tools
    cmake
  ];
  shellHook = ''
    echo "C/C++ environment is ready!"
    exec fish
  '';
}
