{lib,config,pkgs,inputs,modulesPath,...}:
with lib;
let
	cfg = config.modules.gaming;
in
 {
	options.modules.gaming = { enable = mkEnableOption "gaming"; };
	config = mkIf cfg.enable {
    #packages
    home.packages = with pkgs; [
      parsec-bin
      polymc
      osu-lazer
    ];

    #game config if exist :3
	};
 }


