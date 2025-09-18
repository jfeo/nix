{
  inputs,
  pkgs,
  ...
}:

{
  imports = [
    inputs.nvf.homeManagerModules.default
    ./home
  ];

  home = {
    stateVersion = "25.05"; # Do not change without ensuring compatibility

    username = "feo";
    homeDirectory = "/home/feo";

    packages = with pkgs; [
      wget
      curl
      swww
      hyprpolkitagent
      hyprlock
      obsidian
      dunst
      wl-clipboard
      networkmanagerapplet
      wl-color-picker
      playerctl
      brightnessctl
      pavucontrol
    ];

    sessionVariables = {
      EDITOR = "vim";
    };
  };

  programs.firefox.enable = true;
  programs.alacritty = {
    enable = true;
    settings = {
      font.size = 12;
      font.normal.family = "Berkeley Mono Nerd Font";
    };
  };
  programs.kitty.enable = true; # for default hyprland setup
  programs.rofi.enable = true;
  programs.wofi.enable = true;
  programs.git = {
    enable = true;
    userEmail = "jens@feodor.dk";
    userName = "Jens Feodor Nielsen";
    aliases = {
      co = "checkout";
    };
  };

  services.swaync.enable = true;
  services.blueman-applet.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
