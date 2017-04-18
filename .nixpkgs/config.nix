let
    pkgs = import <nixpkgs> {};
in rec {
  workEnv = pkgs.buildEnv {
    name = "work-env";
    paths = [
        my_neovim
        pkgs.ctags

        my_python
    ];
  };

  my_neovim = pkgs.neovim.override {
      vimAlias = true;
      configure = import ./nvim/default.nix { inherit pkgs; };
  };

  my_python = pkgs.python35.buildEnv.override {
    extraLibs = with pkgs.python35Packages; [
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
