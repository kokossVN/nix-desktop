{lib,config,pkgs,inputs,modulesPath,...}:
with lib;
let
	cfg = config.modules.gaming;
in
 {
  imports = [
    ./minecraft
  ];
	options.modules.gaming = { enable = mkEnableOption "gaming"; };
	config = mkIf cfg.enable {
    home.packages = with pkgs; [
      parsec-bin
      polymc
    ];
	};
 }


