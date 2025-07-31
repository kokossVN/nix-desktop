
{config,lib,inputs,pkgs,...}:
{
	imports = [
    ../../modules/default.nix # import all home-manager package and config
    ./default.nix # local user config
  ];
	config.modules = {
		nvim.enable = true;
		firefox.enable = true;
		hyprland.enable = true;
    gaming.enable = true;
	};

}

