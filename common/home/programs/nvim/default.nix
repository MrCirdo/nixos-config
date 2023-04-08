{pkgs, ...}: let
  github-copilot-latest = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "github-copilot-latest.vim";
    version = "1.8.3";
    src = pkgs.fetchFromGitHub {
      owner = "github";
      repo = "copilot.vim";
      rev = "9e869d29e62e36b7eb6fb238a4ca6a6237e7d78b";
      sha256 = "B+2hHNTrabj6O9F6OoskNIUsjJXLrt+4XgjuiRoM80s=";
    };
  };

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

    plugins = with pkgs.vimPlugins;
      [
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
      ]
      ++ [github-copilot-latest];

    extraConfig = builtins.readFile ./config.vim;
  };
}
