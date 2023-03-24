{pkgs, ...}: let
  nvimTreesitterWithPlugins =
    pkgs.vimPlugins.nvim-treesitter.withPlugins
    (plugins:
      with plugins; [
        tree-sitter-agda
        tree-sitter-bash
        tree-sitter-c
        tree-sitter-cmake
        tree-sitter-cpp
        tree-sitter-dockerfile
        tree-sitter-go
        tree-sitter-html
        tree-sitter-java
        tree-sitter-json
        tree-sitter-latex
        tree-sitter-lua
        tree-sitter-make
        tree-sitter-markdown
        tree-sitter-nix
        tree-sitter-python
        tree-sitter-rust
        tree-sitter-yaml
      ]);
in {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    plugins = with pkgs.vimPlugins; [
      auto-pairs
      cmp_luasnip
      cmp-nvim-lsp
      gruvbox
      indent-blankline-nvim
      lightline-vim
      luasnip
      material-nvim
      neovim-ayu
      nerdtree
      null-ls-nvim
      nvim-cmp
      nvim-lspconfig
      nvimTreesitterWithPlugins
      onedark-nvim
      packer-nvim
      vim-devicons
      vim-lastplace
      vim-nix
    ];

    extraConfig = builtins.readFile ./config.vim;
  };
}
