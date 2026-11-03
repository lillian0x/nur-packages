{
  lib,
  stdenvNoCC,
  fetchzip,
}:
stdenvNoCC.mkDerivation rec {
  pname = "asebi";
  version = "1.011";

  src = fetchzip {
    url = "https://ss1.xrea.com/metasta.s602.xrea.com/asebimin.zip";
    hash = "sha256-FGbG9X18X4FUj++uVNTOO/KppbvWfM+BuPIJHAMzXSI=";
    stripRoot = false;
  };

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/fonts/truetype
    find . -type f \( -name "*.ttf" -o -name "*.otf" \) \
      -exec cp {} $out/share/fonts/truetype/ \;

    runHook postInstall
  '';

  meta = with lib; {
    description = "Asebi Mincho";
    downloadPage = "https://metasta.github.io/asebi/";
    homepage = "https://metasta.github.io/asebi/";
    license = licenses.ipa;
    platforms = platforms.all;
  };
}
