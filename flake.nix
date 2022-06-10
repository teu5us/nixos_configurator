{
  description = "NixOS Configurator Web-App";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        nixosRelease = import "${pkgs.path}/nixos/release.nix" {};
      in
        {
          devShell = import ./develop.nix { inherit pkgs nixosRelease; };
        }
    );
}
