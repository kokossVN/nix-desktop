{
  description = "Home Manager configuration of kokoss";

  inputs = {
  	nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        nur = {
            url = "github:nix-community/NUR";
            inputs.nixpkgs.follows = "nixpkgs";
      
        };
        sub = {
          url = "git+file:hosts/kokoss/config/nvim?submodule=1";
          flake = false;
      };
	hyprland.url = "github:hyprwm/Hyprland";
  polymc.url = "github:PolyMC/PolyMC";
};

  outputs =
    { nixpkgs, home-manager, nur, hyprland, ... }@inputs:
    let
	system = "x86_64-linux"; #current system
	pkgs = nixpkgs.legacyPackages.${system};
	lib = nixpkgs.lib;
	#System Function
	mkSystem = pkgs: system: hostname:
		pkgs.lib.nixosSystem {
		system = system;
		modules = [
			{networking.hostName = hostname; }
			./modules/system/configuration.nix
			(./. + "/hosts/${hostname}/hardware-configuration.nix")
			home-manager.nixosModules.home-manager {
				home-manager = {
					useUserPackages = true;
					useGlobalPkgs = true;
					extraSpecialArgs = { inherit inputs; };
					users.kokoss = (./. + "/hosts/${hostname}/user.nix");
				};
				nixpkgs.overlays = [
					nur.overlays.default
          inputs.polymc.overlay
				];
			}
		];
		specialArgs = { inherit inputs; };
	};
    in
    {
	nixosConfigurations = {
		kokoss = mkSystem inputs.nixpkgs system "kokoss";
		  nix.settings = {
		    substituters = ["https://hyprland.cachix.org"];
		    trusted-substituters = ["https://hyprland.cachix.org"];
		    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
		  };
	};
    };
}
