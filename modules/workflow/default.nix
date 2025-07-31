{libs,pkgs,options,...}:
{
  programs.tmux = {
    enable = true;
  };
  home.packages = with pkgs; [
    tree
  ];
}
