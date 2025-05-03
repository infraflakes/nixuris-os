{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [

    # Git
    pkgs.git-filter-repo

    # Docker
    pkgs.docker  # or pkgs.docker-client

    # C/C++
    pkgs.gcc
    pkgs.gdb
    pkgs.clang-tools
    pkgs.cmake
    pkgs.ninja

    # Java
    pkgs.jdk

    # JS/Node
    pkgs.nodejs_23
    pkgs.pnpm
    pkgs.nodePackages.eslint
    pkgs.nodePackages.prettier

    # Python + tools
    (pkgs.python3.withPackages (ps: with ps; [
           pip
      virtualenv
    ]))

];


shellHook = ''
  LIBRARY_PATH="${pkgs.stdenv.cc.cc}/lib:${pkgs.glibc}/lib:${pkgs.libgcc}/lib:${pkgs.libclang}/lib"

  export NIX_LD_LIBRARY_PATH="$LIBRARY_PATH"
  export NIX_LD="${pkgs.stdenv.cc}/nix-support/dynamic-linker"

  # Python venv setup
  if [ ! -d .venv ]; then
    python -m venv .venv
  fi
    export VIRTUAL_ENV_DISABLE_PROMPT=1
  source .venv/bin/activate
  echo "Dev environment (Java, JS, C/C++, Python) is ready!"
 exec fish
 '';
 }

