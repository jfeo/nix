{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # desktop environment
    hyprpolkitagent
    hypridle
    hyprlock
    wev
    nwg-look
    nwg-displays
    networkmanagerapplet
    dunst
    rofi-power-menu
    rofi-file-browser
    grimblast
    catppuccin-gtk
    catppuccin-cursors.mochaDark
    playerctl
    brightnessctl
    pavucontrol
    swww
    wl-color-picker

    google-chrome
    vlc
    signal-desktop

    # cli network utils
    wget
    curl
    nmap
    manix # nix help/docs

    # cli utils
    silver-searcher
    starship
    jq
    file
    wl-clipboard

    # fonts
    font-awesome
    fira

    # programming
    typst
    typstyle
    gcc
    gnumake
    cmake

    # torrent
    qbittorrent

    # networking
    protonvpn-gui

    # file management and viewers
    xfce.thunar
    xfce.thunar-volman
    xfce.thunar-archive-plugin
    xfce.thunar-media-tags-plugin
    xfce.tumbler # thumbnails
    xfce.catfish
    kdePackages.okular
    qimgv

    # editing and office software
    obsidian
    gimp
    pinta
    inkscape
    libreoffice
    scribus

    # rpi
    rpi-imager
  ];
}
