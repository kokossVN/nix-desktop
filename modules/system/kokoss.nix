{pkgs, config, inputs,...}: 
{
  programs.git.enable = true;

  programs.light.enable = true;

  programs.zsh.enable = true;

  users.users.kokoss.shell = pkgs.zsh;

  services.tailscale.enable = true;


  # add some config
  
  programs.hyprland = {
  	enable = true;
  };

  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = true;
      # AllowUsers = ["kokoss"]; # Allows all users by default. Can be [ "user1" "user2" ]
      UseDns = true;
      X11Forwarding = false;
      PermitRootLogin = "prohibit-password"; # "yes", "without-password", "prohibit-password", "forced-commands-only", "no"
    };
  };

  services.pipewire = {
    enable = true; # if not already enabled
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment the following
    #jack.enable = true;
  };

  environment.systemPackages = with pkgs;[
    pavucontrol
    tree
  ];
 

}

