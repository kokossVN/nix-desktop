{lib,config,pkgs,inputs,...}:
with lib;
 {
	home.packages = with pkgs; [
    parsec-bin
    polymc
  ];
 }

