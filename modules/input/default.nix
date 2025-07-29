{lib,config,pkgs,inputs,...}:
with lib;
 {
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      addons = with pkgs; [
      fcitx5-unikey
      fcitx5-gtk 
      fcitx5-lua 
      libsForQt5.fcitx5-qt #Qt5
      kdePackages.fcitx5-qt #Qt6, LMAO
      libsForQt5.fcitx5-with-addons
      ];
      waylandFrontend = true;
    };
  };
  home.sessionVariables = {
      GTK_IM_MODULE="fcitx";
      QT_IM_MODULE="fcitx";
      XMODIFIERS="@im=fcitx";
  };

 }

