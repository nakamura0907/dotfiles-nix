{ pkgs, ...}:

{
	home.packages = with pkgs; [
		# 言語
		# go
		go
		# node
		nodejs_22 pnpm_10

		ansible
		docker colima
		kubectl fluxcd
		tenv
	];
}
