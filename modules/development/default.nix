{ pkgs, ...}:

{
	home.packages = with pkgs; [
		# 言語
		# go
		go
		# node
		nodejs_22 pnpm_10
		# rust
		(rust-bin.stable.latest.default.override {
			extensions = [ "rust-src" ];
   			targets = ["aarch64-unknown-linux-gnu"];
 		})  # oxalica/rust-overlay

		ansible
		# docker colima LocalStack（Dev Containers?）と相性が悪いため異なるコンテナランタイムを使用
		kubectl fluxcd
		tenv
		trivy terraform-docs
	];
}
