{ pkgs, ... }:
let
  nvim-treesitter-plugins = pkgs.vimPlugins.nvim-treesitter.withPlugins
    (plugins: [
      plugins.tree-sitter-c
      plugins.tree-sitter-cpp
      plugins.tree-sitter-nix
      plugins.tree-sitter-python
      plugins.tree-sitter-rust
    ]);
in {
  enable = true;
  viAlias = true;
  vimAlias = true;

  plugins = with pkgs.vimPlugins; [
    vim-nix
    vim-lastplace
    auto-pairs
    nerdtree
    nvim-treesitter-plugins
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
    rust-vim
  ];

  extraConfig = builtins.readFile ./nvim.vim;
}
