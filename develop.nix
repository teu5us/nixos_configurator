{ pkgs }:

with pkgs;

mkShell {
  buildInputs = [
    (python.withPackages (ps: with ps; [
      django
    ]))
  ];
  shellHook = ''
    . ./.env
  '';
}
