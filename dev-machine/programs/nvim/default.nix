{ pkgs, ... }: {
  enable = true;
  viAlias = true;
  vimAlias = true;

  plugins = with pkgs.vimPlugins; [
    vim-nix
    vim-lastplace
    auto-pairs
    nerdtree
    nvim-treesitter
    null-ls-nvim
    nvim-lspconfig
    nvim-cmp
    cmp-nvim-lsp
    cmp_luasnip
    luasnip
    packer-nvim
    onedark-nvim
    material-nvim
    gruvbox
    lightline-vim
    indent-blankline-nvim
    vim-devicons
  ];

  extraConfig = builtins.readFile ./nvim.vim;
}
