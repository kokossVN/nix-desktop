{lib,config,pkgs,...}:
with lib;
let
	cfg = config.modules.nvim;
in
 {
	options.modules.nvim = { enable = mkEnableOption "nvim"; };
	config = mkIf cfg.enable {
	 programs.neovim =  {
      enable = true;
      plugins = with pkgs;[ 
        vimPlugins.lazy-nvim
      ];
      extraPackages = with pkgs; [
          marksman
          nil
          nixpkgs-fmt
          rustup
          lua-language-server
          fzf
          stylua
          gnumake
          zig
          gcc
          clang-tools
          coreutils
          nodejs
          yarn
          # dotnet-sdk
          ripgrep
        ];
	 };
	};
 }

