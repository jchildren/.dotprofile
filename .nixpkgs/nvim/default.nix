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

    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0

    let python_hightlight_all = 1

  '';

  vam.knownPlugins = pkgs.vimPlugins;
  vam.pluginDictionaries = [
    { names = [
      "Solarized"
      "vim-airline"
      "vim-airline-themes"

      "Syntastic"
      "ctrlp"
      "fugitive"
      "tagbar"
      "youcompleteme"
      ];
    }
  ];
}
