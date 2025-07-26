{inputs, pkgs, config, ...}:
{
	home.stateVersion = "25.05";
	home.packages = with pkgs; [
    (pkgs.python3.withPackages (python-pkgs: with python-pkgs; [
      # select Python packages here
      easyocr
    ]))
	kitty 
    obs-studio 
    discord 
    nodejs
    gcc 
    fzf 
    gnumake 
    badlion-client  
    prismlauncher 
    polymc
    nautilus
  ];
	imports = [
		./ide/nvim
		./browser/firefox
		./wayland
		./input
	];
}
