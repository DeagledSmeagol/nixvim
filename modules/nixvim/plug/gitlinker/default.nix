{
  plugins.gitlinker = {
    enable = true;
    settings.callbacks = {
      "github.com" = "get_github_type_url";
      "gitlab.dnm.radiofrance.fr" = "get_github_type_url";
    };
  };
}
