{ pkgs, ...}:

{
	home.packages = with pkgs; [
		# 言語
		# go
		go
		# node
		nodejs_22 pnpm_10
		# rust
		rust-bin.stable.latest.default # oxalica/rust-overlay

		ansible
		docker colima
		kubectl fluxcd
		tenv
	];
}
