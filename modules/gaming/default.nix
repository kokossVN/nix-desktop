{lib,config,pkgs,inputs,...}:
with lib;
let
	cfg = config.modules.firefox;
in
 {
	options.modules.firefox = { enable = mkEnableOption "firefox"; };
	config = mkIf cfg.enable {
    imports = [
      ./minecraft.nix
    ];
    home.packages = with pkgs; [
      parsec-bin
      # polymc
    ];
	};
 }


