{ pkgs, ... }:
{
  extraPlugins = with pkgs.vimPlugins; [
    lazyjj-nvim
  ];

  extraConfigLua = ''
    require("telescope").load_extension("lazyjj")
  '';

  keymaps = [
    {
      mode = "n";
      key = "<leader>jj";
      action = "<cmd>LazyJJ<CR>";
      options = {
        desc = "LazyJJ (root dir)";
      };
    }
  ];
}
