{lib,config,pkgs,inputs,...}:
with lib;
let
	cfg = config.modules.hyprland;
in
 {
	options.modules.hyprland = { enable = mkEnableOption "hyprland"; };
	config = mkIf cfg.enable {
		wayland.windowManager.hyprland = {
			enable = true;
			systemd.enable = true;
			# extraConfig = ''
			# ${builtins.readFile ./hyprland.conf}
			# source = /home/kokoss/nix-config/modules/wayland/hyprland/hyprland.conf
			# '';
			extraConfig = ''
			source = /home/kokoss/nix-config/modules/wayland/hyprland/hyprland.conf
			'';
			package = null;
			portalPackage = null;
		};
		home.packages = with pkgs; [
			wl-clipboard swww wlsunset wf-recorder maim waybar hyprshot
		];

		home.pointerCursor = {
			gtk.enable = true;
			# x11.enable = true;
			package = pkgs.bibata-cursors;
			name = "Bibata-Modern-Classic";
			size = 16;
		};

		gtk = {
			enable = true;

			theme = {
				package = pkgs.flat-remix-gtk;
				name = "Flat-Remix-GTK-Grey-Darkest";
			};

			iconTheme = {
				package = pkgs.adwaita-icon-theme;
				name = "Adwaita";
			};

			font = {
				name = "Sans";
				size = 11;
				};
			};
	};
 }

