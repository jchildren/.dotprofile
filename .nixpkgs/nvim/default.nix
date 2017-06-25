{ pkgs }:

{
  customRC = ''
    filetype plugin indent on
    " show existing tab with 4 spaces width
    set tabstop=4
    " when indenting with '>', use 4 spaces width
    set shiftwidth=4
    " On pressing tab, insert 4 spaces
    set expandtab

    set clipboard=unnamedplus

    syntax enable
    set background=dark
    colorscheme solarized

    let g:airline_theme='solarized'
    if !exists('g:airline_symbols')
        let g:airline_symbols={}
    endif
    let g:airline_symbols.space="\ua0"
    let g:airline_powerline_fonts=1
    let g:airline#extensions#tabline#enabled=1

    " enables tagbar hotkey
    nmap <F8> :TagbarToggle<CR>

    map <C-n> :NERDTreeToggle<CR>

    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 1

    let python_hightlight_all = 1

    " enables ghc-mod checks when writing haskell files
    autocmd BufWritePost *.hs GhcModCheckAndLintAsync
  '';

  vam.knownPlugins = pkgs.vimPlugins;
  vam.pluginDictionaries = [
    { names = [
      # Appearance
      "Solarized"
      "vim-airline"
      "vim-airline-themes"

      # General functionality
      "Syntastic"
      "ctrlp"
      "fugitive"
      "tagbar"
      "nerdtree"
      "youcompleteme"
      "vim-gitgutter"
      "vimproc"
      "polyglot"

      # Language specific
      "ghcmod"
      ];
    }
  ];
}
