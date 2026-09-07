default:
    @just --list

# macOSにhome-manager設定を適用
home-macos:
    nix run home-manager -- switch --flake .#macos

# WSLにhome-manager設定を適用
home-wsl:
    nix run home-manager -- switch --flake .#wsl

# macOSにnix-darwin設定を適用
darwin:
    sudo nix run nix-darwin -- switch --flake .#macos

# nix fmtで全体を整形
fmt:
    nix fmt

# flakeの評価チェック
check:
    nix flake check

# flake.lockを更新
update:
    nix flake update
