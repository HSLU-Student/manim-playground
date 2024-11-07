# npin 01.11.2024 - https://github.com/NixOS/nixpkgs/commit/080166c15633801df010977d9d7474b4a6c549d7
{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/080166c15633801df010977d9d7474b4a6c549d7.tar.gz") { } }:

pkgs.mkShell {
  venvDir = ".venv";
  nativeBuildInputs = with pkgs.buildPackages; [
    python312
    python312Packages.pip
    python312Packages.setuptools
    python312Packages.wheel
    
    # venv
    python312Packages.venvShellHook
    python312Packages.virtualenv

    # project specific python packages
    python312Packages.manim
  ];

  packages = with pkgs; [
    # other prequests
    ffmpeg
    (texlive.combine {
        inherit (pkgs.texlive)
        scheme-small
        collection-basic
        amsmath
        babel-english
        cbfonts-fd
        cm-super
        ctex
        doublestroke
        dvisvgm
        everysel
        fontspec
        frcursive
        fundus-calligra
        gnu-freefont
        jknapltx
        latex-bin
        mathastext
        microtype
        ms
        physics
        preview
        ragged2e
        relsize
        rsfs
        setspace
        standalone
        tipa
        wasy
        wasysym
        xcolor
        xetex
        xkeyval;
    })
  ];


  shellHook = ''
    virtualenv --no-setuptools venv
    export PATH=$PWD/venv/bin:$PATH
    export PYTHONPATH=venv/lib/python3.12/site-packages/:$PYTHONPATH
    echo "Welcome to Python 3.12 dev-shell including manim"
    manim --version
  '';

 postShellHook = ''
   ln -sf PYTHONPATH/* $venvDir/lib/python3.12/site-packages
 '';
}
