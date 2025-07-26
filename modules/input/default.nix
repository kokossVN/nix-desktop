{lib,config,pkgs,inputs,...}:
with lib;
 {
 i18n.inputMethod = {
	enable = true;
	type = "fcitx5";
	fcitx5 = {
		addons = with pkgs; [
		fcitx5-unikey fcitx5-gtk fcitx5-mozc
		];
		waylandFrontend = true;
	};
 };
 }

