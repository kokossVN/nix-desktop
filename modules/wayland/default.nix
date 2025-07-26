{inputs, pkgs, config, ...}:
{
	#Font config
	fonts.fontconfig.enable = true;
	home.packages = with pkgs;[
	nerd-fonts.hack
	nerd-fonts.fira-code
	];

	imports = [
	./hyprland
	./utilities
	];
}
