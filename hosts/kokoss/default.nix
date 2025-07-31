{inputs, pkgs, config, ...}:
{
  programs.tmux.extraConfig = ''
# Enable mouse control (clickable windows, panes, resizable panes)
set -g mouse on


#remap prefix
#defalut 'C-b' to C-s
# this key bind will never repeat when hold the key

unbind C-b
set-option -g prefix C-s
set-option -g repeat-time 0
bind-key C-s send-prefix
set -g default-terminal "screen-256color"
set -s escape-time 0

#remap split pane
#defalut vertical % and horizonal "
#to C-V and C-H
#
# unbind '"'
# unbind %
# bind H split-window -h
# bind V split-window -v

#move cusor like vim 
bind -n C-k select-pane -U
bind -n C-j select-pane -D
bind -n C-h select-pane -L
bind -n C-l select-pane -R
  '';
  xdg.configFile = {
      nvim = {
      source = ./config/nvim; #lazy, gonna fix soon
      recursive = true;
    };
  };
}
