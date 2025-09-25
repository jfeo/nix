{
  inputs,
  ...
}:

{
  imports = [
    inputs.nvf.homeManagerModules.default
    inputs.catppuccin.homeModules.catppuccin
    ./home
  ];

  home.stateVersion = "25.05"; # Do not change without ensuring compatibility

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
