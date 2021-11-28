{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
    defaultEditor = true;
    configure = {
      customRC = ''
        set shiftwidth=2
        set softtabstop=2
        set expandtab
        set background=dark
        let g:deoplete#enable_at_startup = 1
        ${(fileContents ./coc.vim)}
      '';
      packages.myVimPackage = with pkgs.vimPlugins; {
        start = [
          vim-startify
          airline
          sensible
          polyglot
          ale
          fugitive
          deoplete-nvim
          coc-vimtex
          coc-nvim
        ];
        opt = [ ];
      };
    };
  };
}
