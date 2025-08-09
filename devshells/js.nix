{pkgs}:
pkgs.mkShell {
  buildInputs = [
    pkgs.nodejs_24
    pkgs.pnpm
    pkgs.nodePackages.eslint
    pkgs.nodePackages.prettier
  ];

  shellHook = ''
    export NPM_CONFIG_PREFIX="$HOME/.local"
    export PATH="$HOME/.local/bin:$PATH"

    echo "JS environment is ready!"
    exec fish
  '';
}
