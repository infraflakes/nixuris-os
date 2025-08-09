{pkgs}:
pkgs.mkShell {
  buildInputs = [
    pkgs.gcc
    pkgs.gdb
    pkgs.clang-tools
    pkgs.cmake
  ];
  shellHook = ''
    echo "C/C++ environment is ready!"
    exec fish
  '';
}
