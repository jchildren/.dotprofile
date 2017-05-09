let
  pkgs_override = import ((import <nixpkgs> {}).fetchFromGitHub {
    owner = "NixOS";
    repo = "nixpkgs";
    rev = "e50203bfde29065fd7d1f047d9e3797f5c302b76";
    sha256 = "01v29j2701x4gaihgskryri0kxvxwbb59wymb9yb31q82hv4qhf9";
  }) {};
in
  { pkgs ? pkgs_override }:

pkgs.buildEnv {
  name = "go-dev-1.8";
  paths = with pkgs; [
    go
  ];
}
