
{config,lib,inputs,pkgs,...}:
{
	imports = [ ../../modules/default.nix ];
	config.modules = {
		nvim.enable = true;
		firefox.enable = true;
		hyprland.enable = true;
	};
}

