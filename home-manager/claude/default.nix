{ config, pkgs, inputs, lib, ...} :

{
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "claude-code"
  ];
  home.packages = with pkgs; [
    claude-code
    inputs.ccusage.packages.${pkgs.system}.default
    rtk
  ];

  home.activation = {
    installUvTools = config.lib.dag.entryAfter ["writeBoundary"] ''
    UV_BIN="${pkgs.uv}/bin/uv"

    if [ -x "$UV_BIN" ]; then
      echo "Running uv tool installs via $UV_BIN..."
      
      $DRY_RUN_CMD "$UV_BIN" tool install graphifyy || true
    else
      echo "uv binary not found in nix store, skipping tool installation."
    fi
    '';
  };
}
