# Dotfiles

My personal configuration files for a streamlined development environment, focusing on Shell and terminal customization.

## 📦 Repository Contents

### Core Configuration Files
- `.bashrc` - Main Bash shell configuration
- `.bash_aliases` - Custom shell aliases and shortcuts
- `.profile` - Login shell configuration
- `.tmux.conf` - tmux terminal multiplexer settings
- `.gitconfig` - Git configuration

### Directory Structure
- `.config/` - Configuration files for various applications
- `bin/` - Custom scripts and executables

### Installation Scripts
- `flatpaks_install.sh` - Script for installing Flatpak applications
- Installation logs for different environments:
  - `to_install_gnome.log`
  - `to_install_sway.log`
  - `to_install_nala.log`

## 🚀 Installation

### Prerequisites
- Git
- GNU Stow (for managing symlinks)

### Basic Setup
1. Clone the repository:
   ```bash
   git clone https://github.com/juandrzej/dotfiles.git ~/.dotfiles
   cd ~/.dotfiles
   ```

2. Use Stow to create symlinks:
   ```bash
   stow . -t ~
   ```
   This will automatically create symlinks for all configuration files in your home directory.

### Additional Components

#### Flatpak Applications
To install the predefined Flatpak applications:
```bash
./flatpaks_install.sh
```

## 🛠️ Environment Setups

The repository includes configuration files for different desktop environments:
- GNOME
- Sway (Wayland-based window manager)

Check the respective `.log` files for package requirements for each environment.

## 📝 Configuration Notes

### Shell Configuration
- `.bashrc` provides the main shell configuration
- `.bash_aliases` contains useful aliases and functions
- `.profile` handles login shell settings

### Terminal Multiplexer
- `.tmux.conf` includes a comprehensive tmux configuration for enhanced terminal workflow

---

**Note:** Before installing, review the configuration files and modify them according to your preferences. These dotfiles are personally tailored but can serve as a good starting point for your own configuration.
