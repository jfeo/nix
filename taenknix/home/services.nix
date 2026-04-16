{pkgs, ...}: {
  services = {
    batsignal = {
      enable = true;
      extraArgs = ["-I" "battery" "-w" "20" "-c" "10" "-d" "5" "-p" "-m" "2"];
    };
    blueman-applet.enable = true;
    ssh-agent.enable = true;
    swaync.enable = true;
    swayosd.enable = true;
  };

  # Polkit authentication agent for graphical sudo prompts (pkexec)
  systemd.user.services.polkit-gnome-authentication-agent-1 = {
    Unit = {
      Description = "Polkit GNOME Authentication Agent";
      After = ["graphical-session.target"];
      PartOf = ["graphical-session.target"];
    };
    Service = {
      Type = "simple";
      ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
    Install.WantedBy = ["graphical-session.target"];
  };
}
