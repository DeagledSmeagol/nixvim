{ pkgs, ... }: {
  extraPackages = [
    pkgs.imagemagick
    pkgs.tectonic
    pkgs.tetex
    pkgs.mermaid-cli

  ];
  plugins.snacks = {
    settings = {
      image = {
        enabled = true;
      };
    };
  };
}
