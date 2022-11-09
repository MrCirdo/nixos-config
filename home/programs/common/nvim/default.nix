{pkgs, ...}: let
  nvimTreesitterWithPlugins =
    pkgs.vimPlugins.nvim-treesitter.withPlugins
    (plugins:
      with plugins; [
        tree-sitter-c
        tree-sitter-cpp
        tree-sitter-nix
        tree-sitter-python
        tree-sitter-rust
        tree-sitter-go
        tree-sitter-yaml
        tree-sitter-make
        tree-sitter-json
        tree-sitter-java
        tree-sitter-html
        tree-sitter-bash
        tree-sitter-agda
        tree-sitter-latex
        tree-sitter-cmake
        tree-sitter-markdown
        tree-sitter-dockerfile
        tree-sitter-lua
      ]);
in {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    plugins = with pkgs.vimPlugins; [
      vim-nix
      vim-lastplace
      auto-pairs
      nerdtree
      nvimTreesitterWithPlugins
      null-ls-nvim
      nvim-lspconfig
      nvim-cmp
      cmp-nvim-lsp
      cmp_luasnip
      luasnip
      packer-nvim
      onedark-nvim
      material-nvim
      neovim-ayu
      gruvbox
      lightline-vim
      indent-blankline-nvim
      vim-devicons
    ];

    extraConfig = builtins.readFile ./config.vim;
  };
}
