{
  pkgs ? import <nixpkgs> { },
}:
pkgs.mkShell {
  buildInputs = with pkgs; [
    rustc
    cargo
    rustfmt
    clippy
    rust-analyzer
  ];
  shellHook = ''
    export PATH="$HOME/.cargo/bin:$PATH"
       echo "Rust environment is ready!"
       exec fish
  '';
}
