{pkgs}:
pkgs.mkShell {
  buildInputs = [
    (pkgs.python3.withPackages (ps: with ps; [pip virtualenv]))
  ];

  shellHook = ''
    if [ ! -d .venv ]; then
      python -m venv .venv
    fi
    export VIRTUAL_ENV_DISABLE_PROMPT=1
    source .venv/bin/activate

    echo "Python environment is ready!"
    exec fish
  '';
}
