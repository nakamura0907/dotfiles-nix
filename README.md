## コマンド集

- `nix run home-manager -- switch --flake .#macos`
- `nix run home-manager -- switch --flake .#wsl`

## セットアップ手順

**WSL2のインストール**

```bash
# Windows(WSL2)
wsl --install
```

**nixコマンドのインストール**

```bash
# MacOS
sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install)

# WSL2
sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --daemon
mkdir -p ~/.config/nix && echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
```

**Home Managerの実行**

```bash
nix flake update
nix run home-manager -- switch --flake .#<hosts>
```

**デフォルトシェルの切り替え**

```bash
# WSL2
# https://qiita.com/kpkpkp/items/c9d0345e5bbfffa71a15
command -v zsh | sudo tee -a /etc/shells
sudo chsh -s $(which zsh) $USER
```