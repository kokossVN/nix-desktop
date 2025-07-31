{inputs, pkgs, config, lib, ...}:
{
  #Submodule for optimize :>
	imports = [
		./ide
		./browser
		./wayland
		./input
    ./gaming
    ./workflow
	];
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

    #workflow
    kitty 
    gnumake 
    nodejs
    fzf
    gcc 
    ripgrep
  ];


  xdg.desktopEntries = {
    discord = {
      name = "Discord";
      genericName = "All-in-one cross-platform voice and text chat for gamers, FUCK FCITX5";
      exec = "zsh -c discord";
      terminal = false;
      categories = [ "Application" "Network" "InstantMessaging" ];
      mimeType = ["x-scheme-handler/discord"];
      };
  };

}
