{pkgs, ...}: {
  home.packages = with pkgs; [
    # desktop environment
    grim # screenshot tool
    slurp # screen area selector
    wlsunset # blue light filter
    wev
    nwg-look
    nwg-displays
    networkmanagerapplet
    dunst
    rofi-power-menu
    rofi-file-browser
    catppuccin-gtk
    catppuccin-cursors.mochaDark
    playerctl
    brightnessctl
    pavucontrol
    awww
    wl-color-picker
    solaar # manage logitech devices

    google-chrome
    vlc
    signal-desktop

    # cli network utils
    wget
    curl
    nmap
    manix # nix help/docs

    # cli utils
    silver-searcher-ng
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
    proton-vpn

    # file management and viewers
    thunar
    thunar-volman
    thunar-archive-plugin
    thunar-media-tags-plugin
    tumbler # thumbnails
    catfish
    kdePackages.okular
    qimgv
    calibre

    # editing and office software
    obsidian
    gimp
    pinta
    inkscape
    libreoffice
    scribus

    # music software
    tuxguitar

    # rpi
    rpi-imager
  ];
}
