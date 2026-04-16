{
  requireFile,
  stdenvNoCC,
  unzip,
}:
stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "berkeley-mono-nerd-font";
  version = "0.0.1";

  src = requireFile {
    name = "berkeley-mono-nerd-font-ttf.zip";
    sha256 = "1wqr069slx0wc5yxy3wcjb2r3d2s5fdbj4d9xawx2n1f41krar01";
    message = ''
      Prefetch the zip file of the patched berkeley mono nerd font.

      nix-prefetch-url --type sha256 file://\$PWD/berkeley-mono-nerd-font-ttf.zip
    '';
  };

  nativeBuildInputs = [
    unzip
  ];

  unpackPhase = ''
    unzip $src
  '';

  installPhase = ''
    runHook preInstall

    install -D -m444 -t $out/share/fonts/truetype berkeley-mono-nerd-font-ttf/*.ttf

    runHook postInstall
  '';
})
