{
  config,
  pkgs,
  lib,
  ...
}:
let
  colors = import ../colorscheme/colors/${config.theme}.nix { };

  nixos-svg-content = with colors; ''
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="-1160 -1000 2320 2000">
            <defs>
              <polygon
                id="flake"
                points="-304 -305 -176 -525 384 443 128 443 -4 222 -128 443 -256 443 -320 332 -128 0"
              />
            </defs>

            <use href="#flake" fill="${base08}"
              transform="translate(-320 554) rotate(0 320 -554)"/>

            <use href="#flake" fill="${base09}"
              transform="translate(-320 554) rotate(60 320 -554)"/>

            <use href="#flake" fill="${base0A}"
              transform="translate(-320 554) rotate(120 320 -554)"/>

            <use href="#flake" fill="${base0B}"
              transform="translate(-320 554) rotate(180 320 -554)"/>

            <use href="#flake" fill="${base0D}"
              transform="translate(-320 554) rotate(240 320 -554)"/>

            <use href="#flake" fill="${base0E}"
              transform="translate(-320 554) rotate(300 320 -554)"/>
          </svg>
  '';
in
{
  plugins.snacks = {
    settings = {
      dashboard = {
        enabled = true;
        preset = {
          keys = [
            {
              icon = " ";
              key = "f";
              desc = "Find File";
              action = "<leader>ff";
            }
            {
              icon = " ";
              key = "n";
              desc = "New File";
              action = ":ene | startinsert";
            }
            {
              icon = " ";
              key = "/";
              desc = "Find Text";
              action = "<leader>fr";
            }
            {
              icon = " ";
              key = "r";
              desc = "Recent Files";
              action = "<leader>fg";
            }
            {
              icon = "";
              key = "o";
              desc = "LazyGit";
              action = "<leader>gg";
            }
            {
              icon = " ";
              key = "q";
              desc = "Quit";
              action = ":qa";
            }
          ];
        };
        sections = [
          {
            section = "terminal";
            cmd = "echo '${nixos-svg-content}' | ${lib.getExe pkgs.chafa} --format symbols --symbols half --size 60x60; sleep .1";
            height = 30;
            padding = 1;
          }
          {
            icon = " ";
            pane = 2;
            title = "Keymaps";
            section = "keys";
            padding = 1;
            indent = 3;
          }
          {
            icon = " ";
            pane = 2;
            title = "Recent Files";
            section = "recent_files";
            padding = 1;
            indent = 3;
          }
          {
            icon = " ";
            pane = 2;
            title = "Projects";
            section = "projects";
            padding = 1;
            indent = 3;
          }
          {
            pane = 2;
            icon = " ";
            title = "Git Status";
            section = "terminal";
            enabled.__raw = ''
              Snacks.git.get_root() ~= nil
            '';
            cmd = "${pkgs.hub}/bin/hub status --short --branch --renames";
            height = 5;
            padding = 1;
            ttl = 5 * 60;
            indent = 3;
          }
        ];
      };
    };
  };
}
