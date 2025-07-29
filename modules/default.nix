{inputs, pkgs, config, ...}:
{
	home.stateVersion = "25.05";
  #shell config
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
    };
  };

  programs.ssh = {
    enable = true;
  };

	home.packages = with pkgs; [
    #Python
    (pkgs.python3.withPackages (python-pkgs: with python-pkgs; [
      # select Python packages here
      easyocr
    ]))

    #Stuff
    obs-studio 
    discord 
    nautilus

    #Terminal
    kitty 

    #Build/Dev
    gnumake 
    nodejs
    fzf
    gcc 
  ];

  #Submodule for optimize :>
	imports = [
		./ide
		./browser
		./wayland
		./input
    ./gaming
	];

}
