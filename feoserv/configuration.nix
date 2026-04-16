# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    kernelPackages = pkgs.linuxPackages_latest;
  };

  networking = {
    hostName = "feoserv";
    firewall = {
      allowedTCPPorts = [ 22 80 443 ];
      allowedUDPPorts = [  ];
    };
    networkmanager.enable = true;
  };

  time.timeZone = "Europe/Copenhagen";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "dk";
  };

  users = {
    mutableUsers = false;
    users.feo = {
      uid = 1000;
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" "docker" ];
      hashedPassword = "$y$j9T$ZveFkD0w8uhuStn7pSKny1$tx4NXiSvn9oKMdE66SYoeZvihMEHr.zOUyg4I9Z4nF1";
      packages = with pkgs; [ ];
    };
  };

  environment.systemPackages = with pkgs; [
    bash
    wget
    docker-compose
  ];

  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
      vimAlias = true;
      configure = {
        customLuaRC = ''
          vim.opt.relativenumber = true
          vim.opt.shiftwidth = 2
          vim.opt.tabstop = 2
          vim.opt.expandtab = true
          vim.opt.textwidth = 80
        '';
      };
    };

    git = {
      enable = true;
      config = {
        init = {
          defaultBranch = "main";
        };
        user = {
          email = "jens@feodor.dk";
          name = "Jens Feodor Nielsen";
        };
      };
    };
  };

  services = {
    openssh.enable = true;
    avahi.enable = true;
  };

  virtualisation = {
    docker = {
      enable = true;
      autoPrune = {
        enable = true;
        dates = "weekly";
      };
    };
  };

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.11"; # Did you read the comment?
}

# vim: ts=2 sw=2 et
