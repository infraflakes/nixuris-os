{
  pkgs ? import <nixpkgs> { },
}:
pkgs.mkShell {
  buildInputs = with pkgs; [
    nodejs_24
    pnpm
    nodePackages.eslint
    nodePackages.prettier
  ];

  shellHook = ''
    export NPM_CONFIG_PREFIX="$HOME/.local"
    export PATH="$HOME/.local/bin:$PATH"

    echo "JS environment is ready!"
    exec fish
  '';
}
