# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with
code in this repository.

## Repository Overview

This is a NixOS system configuration using flakes with home-manager integration
for a machine named "taenknix". The configuration uses a modular structure with
system-level settings in the root and user-level settings in the `home/`
directory.

## System Architecture

### Flake Structure

- **flake.nix**: Main entry point defining inputs (nixpkgs, home-manager, nvf,
  catppuccin) and outputs
- **configuration.nix**: System-level NixOS configuration (bootloader,
  networking, desktop environment, services)
- **hardware-configuration.nix**: Hardware-specific settings (auto-generated,
  should not be manually edited)
- **home.nix**: Entry point for home-manager configuration, imports all
  user-level modules

### Module Organization

All user-level configuration is split into focused modules in `home/`:

- **default.nix**: Imports all home modules (acts as a registry)
- **nvf.nix**: Neovim configuration using nvf (NotAShelf/nvf framework)
- **packages.nix**: User-installed packages
- **claude-code.nix**: Claude Code CLI configuration
- **sway/**: Sway window manager (config.nix, idle.nix, lock.nix)
- **programs/**: Application configs (alacritty, bat, firefox, git, thunderbird)
- **shell/**: Shell environment (bash, direnv, starship)
- **theme/**: Visual theming (catppuccin, gtk, qt, cursor)
- **scripts/**: Custom shell scripts (screenshot, audio device choosers)
- Additional modules: rofi, services, waybar, xdg

### Custom Packages

**fonts/berkeley-mono-nerd-font.nix**: Custom font derivation using
`requireFile` for proprietary font

- Requires manual prefetching:
  `nix-prefetch-url --type sha256 file://$PWD/berkeley-mono-nerd-font-ttf.zip`
- Referenced in configuration.nix via `packageOverrides`

## Common Commands

### Building and Activating Configuration

```bash
# Rebuild system configuration (uses pkexec for graphical auth prompt)
pkexec nixos-rebuild switch --flake .#taenknix

# Build without activating
pkexec nixos-rebuild build --flake .#taenknix

# Test configuration (temporary, lost on reboot)
pkexec nixos-rebuild test --flake .#taenknix
```

### Updating Dependencies

```bash
# Update all flake inputs
nix flake update

# Update specific input
nix flake lock --update-input nixpkgs
nix flake lock --update-input home-manager
```

### Checking Configuration

```bash
# Check flake for errors
nix flake check

# Show flake info
nix flake show

# Show flake metadata
nix flake metadata
```

### Home Manager Standalone (if needed)

```bash
# Rebuild home-manager configuration only
home-manager switch --flake .#feo
```

## Development Workflow

### Adding New Packages

1. For user packages: Add to `home/packages.nix` in the `home.packages` list
2. For system packages: Add to `configuration.nix` in
   `environment.systemPackages`
3. Run `pkexec nixos-rebuild switch --flake .#taenknix`

### Creating New Home Modules

1. Create new `.nix` file in appropriate location:
   - `home/programs/` for application configurations
   - `home/shell/` for shell-related settings
   - `home/theme/` for theming modules
   - `home/scripts/` for custom scripts
   - `home/` root for standalone modules
2. If creating a directory module, add `default.nix` that imports other files
3. Add import to `home/default.nix` (or the appropriate subdirectory's
   `default.nix`)
4. Follow existing module patterns (take inputs like `{pkgs, ...}`)

### Modifying Nvf Configuration

The neovim configuration in `home/nvf.nix` uses the nvf framework with
structured sections:

- Basic editor options (globals, options)
- User interface and interaction (theme, dashboard, telescope, statusline, UI
  plugins)
- Version control (vim-fugitive)
- File tree explorer (neo-tree with float position)
- Language support (LSP, treesitter, autocomplete, diagnostics, formatters,
  debuggers)
- Key bindings and keymaps (whichKey with helix preset)
- Window highlighting (custom autocmds for active window)

Leader key is set to `,` (comma).

### Custom Scripts

The `home/scripts/` module provides custom shell scripts packaged with
`writeShellApplication`:

- **screenshot**: Screenshot utility using grim/slurp with clipboard support
- **rofi-sound-output-chooser**: Select audio output device via rofi menu
- **rofi-sound-input-chooser**: Select audio input device via rofi menu

To add a new script:

1. Create `.sh` file in `home/scripts/`
2. Add a `writeShellApplication` block in `home/scripts/default.nix`
3. Add the script to `home.packages` in the same file

### Working with Custom Fonts

When adding the Berkeley Mono Nerd Font:

1. Place `berkeley-mono-nerd-font-ttf.zip` in `fonts/` directory
2. Run:
   `nix-prefetch-url --type sha256 file://$PWD/fonts/berkeley-mono-nerd-font-ttf.zip`
3. Update sha256 in `fonts/berkeley-mono-nerd-font.nix` if needed
4. Font is already registered in `configuration.nix` packageOverrides

## Key Configuration Details

### Desktop Environment

- Display manager: SDDM (Wayland mode with Catppuccin theme)
- Window manager: Sway (configured in `home/sway/`)
- Primary monitor: eDP-1 (1920x1200@60)
- Office monitors: Dell P2416D (left), Microstep MSI MP273A (top)
- Modifier key: SUPER (Windows key)

### System Settings

- Hostname: taenknix
- Timezone: Europe/Copenhagen
- Locale: en_DK.UTF-8 with Danish locale settings
- Keyboard: Danish (dk-latin1 console, dk X11)
- User: feo (Jens Feodor Nielsen)
- Experimental features enabled: nix-command, flakes
- Unfree packages: allowed

### Important Inputs

- **nixpkgs**: nixos-unstable channel
- **home-manager**: For user-level configuration
- **nvf**: Neovim configuration framework
- **catppuccin**: Theming across applications

## State Versions

- System state version: 25.05
- Home state version: 25.05
- Do not change these values without reading documentation
