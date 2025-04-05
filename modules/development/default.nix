{ pkgs, ...}:

{
	home.packages = with pkgs; [
		# go
		go
		# node
		nodejs_22 pnpm_10
	];
}
