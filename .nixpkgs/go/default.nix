let
  pkgs_override = import ((import <nixpkgs> {}).fetchFromGitHub {
    owner = "NixOS";
    repo = "nixpkgs";
    rev = "b9bea6b17f64bf0e29a253855b95d76c1565d6ac";
    sha256 = "1iimmh4a6kvq2qkdmra81996h6i8iy54hw8l2cmv5g4sdcsx6lgh";
  }) {};
in
  { pkgs ? pkgs_override }:

pkgs.buildEnv {
  name = "go-dev-1.8";
  paths = with pkgs; [
    go
  ];
}
