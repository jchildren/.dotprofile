let
    pkgs = import <nixpkgs> {};
in rec {
  workEnv = pkgs.buildEnv {
    name = "work-env";
    paths = [
        my_neovim
        pkgs.ctags

        # python
        my_python

        # golang
        pkgs.go
    ];
  };

  my_neovim = pkgs.neovim.override {
      vimAlias = true;
      configure = import ./nvim/default.nix { inherit pkgs; };
  };

  my_python = pkgs.python3.buildEnv.override {
    extraLibs = with pkgs.python3Packages; [
        jupyter

        requests2
        numpy
        scipy
        pandas
        matplotlib

        scikitlearn
        tensorflow
        networkx
        ];
  };
}
