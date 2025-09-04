{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  buildInputs = [
    pkgs.alejandra
    pkgs.git-filter-repo
    pkgs.gcc
    pkgs.gdb
    pkgs.clang-tools
    pkgs.cmake
    pkgs.nodejs_24
    pkgs.pnpm
    pkgs.nodePackages.eslint
    pkgs.nodePackages.prettier
    (pkgs.python3.withPackages (ps: with ps; [pip virtualenv]))
    pkgs.go
    pkgs.go-tools
  ];

  shellHook = ''
    export NPM_CONFIG_PREFIX="$HOME/.local"
    export PATH="$HOME/.local/bin:$PATH"

    if [ ! -d .venv ]; then
      python -m venv .venv
    fi
    export VIRTUAL_ENV_DISABLE_PROMPT=1
    source .venv/bin/activate

    echo "All-in-one dev environment ready."
    exec fish
  '';
}
