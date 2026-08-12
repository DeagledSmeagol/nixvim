{ pkgs, ... }: {
  filetype.extension.liq = "liquidsoap";

  extraPackages = [
    pkgs.tree-sitter
  ];

  plugins.treesitter = {
    enable = true;

    settings = {
      indent = {
        enable = true;
      };
      highlight = {
        enable = true;
      };
    };

    folding.enable = true;
    languageRegister.liq = "liquidsoap";
    nixvimInjections = true;
    grammarPackages = pkgs.vimPlugins.nvim-treesitter.allGrammars;
  };
}
