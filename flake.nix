{
    description = "system configuration";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        home-manager = {
            url = "github:nix-community/home-manager/master";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, nixpkgs, home-manager }: {
        nixosConfigurations.nixos = import ./hosts/workstation/host.nix {
            inherit nixpkgs;
            inherit home-manager;
        };
    };
}
