{ config, pkgs, ...}:

let
  user = "lucas";
in
{
  imports = [
    <home-manager/nixos>
  ]; 

  users.users.${user} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "audio" "input" ];
  };

  home-manager.users.${user} = { pkgs, ... }: {
    home.stateVersion = "23.05";
    home.packages = with pkgs; [
      kitty
      firefox-wayland
      thunderbird
      neovim
      fd
      fzf
      ripgrep
      gcc
      gnumake
      wofi
      waybar
      hyprpaper
      imv
      pavucontrol
      waylock
      zathura
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

    home.file.".config/kitty" = {
      source = ./home-manager/kitty;
      recursive = true;
    };

    home.file.".config/hypr" = {
      source = ./home-manager/hypr;
      recursive = true;
    };

    home.file.".config/waybar" = {
      source = ./home-manager/waybar;
      recursive = true;
    };

    home.file."images/bg.jpg" = {
      source = ./home-manager/images/bg.jpg;
    };

    gtk = {
      enable = true;
      cursorTheme = {
        package = pkgs.gnome.adwaita-icon-theme;
        name = "Adwaita";
      };
      font = {
        package = pkgs.jetbrains-mono;
        name = "JetBrains Mono";
      };
      theme = {
        package = pkgs.graphite-gtk-theme;
        name = "Graphite";
      };
    };
  };
}
