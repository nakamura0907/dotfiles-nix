{ pkgs, ...}:

{
	home.packages = with pkgs; [
		# node
		nodejs_22 pnpm_10
	];
}
