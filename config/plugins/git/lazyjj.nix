{ pkgs, ... }:
{
  extraPlugins = with pkgs.vimPlugins; [
    lazyjj-nvim
  ];

  extraConfigLua = ''
    require("lazyjj").setup{{
      mapping = '<leader>jj'
      }}
  '';
}
