# Supplement

Automatizovane install skripte za brzo podešavanje razvoja okruženja na Arch Linux-u.

## Brza instalacija

```bash
# Kloniraj repo
cd ~/Work/shared
git clone https://github.com/biki96/shared-supplement.git supplement
cd supplement

# Pokreni master instalaciju (sve odjednom)
./master-installation.sh
```

## Install skripte

### Shell & Terminal
- `install-zsh.sh` - Zsh shell
- `install-zsh-plugins.sh` - Zsh plugini (autosuggestions, syntax-highlighting, completions, history-search, bat)
- `install-ghostty.sh` - Ghostty terminal
- `install-tmux.sh` - Tmux + TPM (plugin manager)
- `set-shell.sh` - Postavi zsh kao default shell

### Development Tools
- `install-uv.sh` - uv (Python package manager)
- `install-vscode.sh` - Visual Studio Code
- `install-claude-code.sh` - Claude Code CLI
- `install-claude-desktop.sh` - Claude Desktop app

### System
- `install-stow.sh` - GNU Stow (dotfiles manager)
- `install-brave-nightly-bin.sh` - Brave browser (nightly)
- `install-hyprland-overrides.sh` - Hyprland window manager config
- `install-dotfiles.sh` - Automatski klonira i primenjuje dotfiles

### Master script
- `master-installation.sh` - Pokreće sve install skripte po redosledu

## Pojedinačna instalacija

```bash
# Instaliraj samo ono što ti treba
./install-zsh.sh
./install-zsh-plugins.sh
./install-uv.sh
```

## Kako funkcioniše

Svaka skripta:
1. Proverava da li je alat već instaliran
2. Instalira preko `yay` (Arch package manager) ili standalone installer-a
3. Verifikuje uspešnu instalaciju
4. Izvršava dodatnu konfiguraciju ako je potrebna

## Requirements

- Arch Linux
- `yay` (AUR helper)

## Update

```bash
cd ~/Work/shared/supplement
git pull
```
