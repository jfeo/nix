{ ... }:
{
  programs.starship.enable = true;
  programs.starship.enableBashIntegration = true;
  programs.starship.settings = {
    directory = {
      truncation_length = 8;
      truncate_to_repo = false;
      truncation_symbol = "…/";
    };
  };
}
