{ pkgs, nixosRelease }:

with pkgs;

mkShell {
  buildInputs = [
    (python3.withPackages (ps: with ps; [
      django
    ]))
  ];
  shellHook = ''
    . ./.env
    [ ! -f options.json ] && cp "${nixosRelease.options}/share/doc/nixos/options.json" ./
  '';
}
