{ config, pkgs, lib, ...}:

let
  user = "lucas";
in
{
  imports = [
    <home-manager/nixos>
  ]; 

  users.users.${user} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "audio" "input" "docker" ];
  };

  home-manager.users.${user} = { pkgs, ... }: {
    home.stateVersion = "23.05";
    home.packages = with pkgs; [
      alacritty
      tmux
      firefox-wayland
      neovim
      fd
      fzf
      ripgrep
      jq
      gcc
      gnumake
      wofi
      waybar
      swaylock
      imv
      pavucontrol
      waylock
      zathura
      gammastep
      openconnect
      chromium
      wl-clipboard
      xdg-utils
      grim
      slurp
      swappy
      pamixer
      brightnessctl
      thunderbird
      mullvad-vpn
    ];

    nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
      "datagrip"
    ];

    nixpkgs.overlays = [
      (self: super: {
        waybar = super.waybar.overrideAttrs (oldAttrs: {
          mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
        });
      })
    ];

    home.file.".config/nvim" = {
      source = ./home-manager/nvim;
      recursive = true;
    };

    home.file.".config/alacritty" = {
      source = ./home-manager/alacritty;
      recursive = true;
    };

    home.file.".config/waybar" = {
      source = ./home-manager/waybar;
      recursive = true;
    };

    home.file.".config/sway" = {
      source = ./home-manager/sway;
      recursive = true;
    };

    home.file.".tmux.conf" = {
      source = ./home-manager/tmux/tmux.conf;
    };

    home.file.".local/share/fonts" = {
      source = ./home-manager/fonts;
      recursive = true;
    };

    home.file."images/bg.jpg" = {
      source = ./home-manager/images/bg.jpg;
    };

    gtk = {
      enable = true;
      cursorTheme = {
        package = pkgs.adwaita-icon-theme;
        name = "Adwaita";
      };
      font = {
        package = pkgs.jetbrains-mono;
        name = "JetBrains Mono Nerd Font";
        size = 9;
      };
      theme = {
        package = pkgs.graphite-gtk-theme;
        name = "Graphite";
      };
    };

    services.mako = {
        enable = true;
    };
    services.cliphist.enable = true;
  };
}
