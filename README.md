## コマンド集

### 初回セットアップ時

- `nix run home-manager -- switch --flake .#macos` - macOS (Apple Silicon) で設定を適用
- `nix run home-manager -- switch --flake .#wsl` - WSL2 (x86_64 Linux) で設定を適用

### 初回セットアップ後

- `just home-macos` - macOS (Apple Silicon) で設定を適用
- `just home-wsl` - WSL2 (x86_64 Linux) で設定を適用
- `just darwin` - macOS に nix-darwin 設定を適用
- `just fmt` - `nix fmt` で全体を整形
- `just check` - `nix flake check` で評価チェック
- `just update` - `nix flake update` で依存関係を更新

## セットアップ手順

### WSL2 のインストール

```bash
# Windows(WSL2)
wsl --install
```

### Nix のインストール

```bash
# macOS
sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install)

# WSL2
sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --daemon
mkdir -p ~/.config/nix && echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
```

### Flake の更新

```bash
nix flake update
```

### nix-darwin の実行 (macOS 初回のみ)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
sudo nix run nix-darwin -- switch --flake .#macos
```

### Home Manager の実行

```bash
nix run home-manager -- switch --flake .#<hosts>
```

**デフォルトシェルの切り替え**

```bash
# WSL2
# https://qiita.com/kpkpkp/items/c9d0345e5bbfffa71a15
command -v zsh | sudo tee -a /etc/shells
sudo chsh -s $(which zsh) $USER
```

## 依存関係

- `nixpkgs` - Nix OS パッケージセット
- `home-manager` - Home Manager リリース 26.05
- `nix-darwin` - nix-darwin リリース 26.05
