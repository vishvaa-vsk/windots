# 🌸 Windots - Windows Configuration Files

<div align="center">

![Catppuccin Mocha](https://github.com/catppuccin/catppuccin/raw/main/assets/palette/demo.png)

**A beautiful and cohesive Windows desktop configuration featuring the Catppuccin Mocha theme**

*Bringing the warmth of Catppuccin to your Windows workflow*

</div>

## ✨ Overview

This repository contains my personal Windows configuration files (dotfiles) that create a unified, aesthetically pleasing desktop environment using the **Catppuccin Mocha** color scheme throughout all applications and tools.

### 🎨 Theme Philosophy

All configurations are built around the **Catppuccin Mocha** color palette, ensuring visual consistency across:
- 🖥️ **Window Management** - GlazeWM with Mocha colors
- 📊 **System Bar** - YASB with custom Mocha styling and fluent aesthetics
- 🖥️ **Terminals** - WezTerm and Windows Terminal
- 🌐 **Browsers** - Brave and Zen with Catppuccin extensions
- ⚡ **Code Editor** - VS Code with Catppuccin + One Dark Pro
- 📋 **System Info** - Custom Fastfetch configuration
- 🐚 **Shell** - Enhanced PowerShell profile

## 🚀 Quick Installation

### Prerequisites

Ensure you have the following tools installed:

```powershell
# Install Scoop (package manager)
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
irm get.scoop.sh | iex

# Install essential tools
scoop install git
scoop bucket add extras
scoop install glazewm yasb wezterm fastfetch
```

### Installation Steps

1. **Clone the repository**
   ```powershell
   git clone https://github.com/yourusername/windots.git
   cd windots
   ```

2. **Backup existing configurations** (optional but recommended)
   ```powershell
   # Backup existing configs
   Move-Item $env:USERPROFILE\.config $env:USERPROFILE\.config.backup -ErrorAction SilentlyContinue
   ```

3. **Install configurations**
   ```powershell
   # Copy configurations to user directory
   Copy-Item .config $env:USERPROFILE\ -Recurse -Force
   
   # Copy PowerShell profile
   $profileDir = Split-Path $PROFILE -Parent
   New-Item -ItemType Directory -Path $profileDir -Force
   Copy-Item .config\Powershell\Microsoft.PowerShell_profile.ps1 $PROFILE -Force
   ```

4. **Start GlazeWM**
   ```powershell
   # GlazeWM will automatically start YASB as configured
   glazewm
   ```

## 🛠️ Components Overview

### 🪟 Window Manager - GlazeWM
- **Tiling window manager** for Windows with i3-like functionality
- **Catppuccin Mocha color scheme** for all UI elements
- **Automatic YASB integration** - starts and stops with the WM
- **Smooth animations** and modern window handling

**Key Features:**
- Dynamic workspace management
- Custom keybindings for efficient workflow
- Float rules for specific applications
- Integrated with system taskbar replacement

### 📊 System Bar - YASB
- **Custom system bar** replacing the default Windows taskbar
- **Fluent design aesthetics** with Catppuccin Mocha colors
- **Useful widgets** for system monitoring and quick access

**Included Widgets:**
- 🏠 Workspace indicator with GlazeWM integration
- 🖥️ System resources (CPU, RAM, Network)
- 🔊 Volume control with visual feedback
- 🗓️ Date and time display
- 🔋 Battery status (for laptops)
- 🌐 Network connectivity status
- 🎵 Media controls

### 💻 Terminals

#### Primary: WezTerm
- **GPU-accelerated terminal** with excellent performance
- **Catppuccin Mocha theme** built-in
- **Enhanced font rendering** with ligature support
- **Tab and pane management**

#### Secondary: Windows Terminal
- **Microsoft's modern terminal**
- **Custom Catppuccin Mocha color scheme**
- **Integration with PowerShell profile**
- **Backup option** when WezTerm is unavailable

### 🐚 PowerShell Profile
- **Enhanced PowerShell experience** with custom prompt
- **Fast startup** with optimized module loading
- **Catppuccin Mocha syntax highlighting**
- **Git integration** with posh-git
- **Beautiful icons** with Terminal-Icons
- **Efficient key bindings** for improved productivity

**Features:**
- Smart tab completion
- History search with arrow keys
- Automatic module installation
- Custom aliases and functions
- Performance optimized startup

### 📋 System Information - Fastfetch
- **Modern system fetch tool** with custom configuration
- **Minimalist design** featuring Windows 11 logo
- **Catppuccin Mocha color scheme** for all elements
- **Essential system information** display

**Displayed Information:**
- Operating system and kernel
- System uptime
- Shell and terminal information
- CPU and memory details
- Disk usage statistics

### 🌐 Browser Integration

#### Brave Browser
- **Catppuccin Mocha theme** extension installed
- **Privacy-focused** with built-in ad blocking
- **Consistent color scheme** with desktop environment

#### Zen Browser
- **Firefox-based** with enhanced privacy features
- **Catppuccin Mocha theme** for cohesive experience
- **Minimalist interface** design

### ⚡ VS Code Configuration
- **Catppuccin + One Dark Pro** theme combination
- **Perfect balance** of warmth and contrast
- **Consistent** with terminal and system colors
- **Enhanced readability** for long coding sessions

## 🎨 Color Palette

The entire configuration uses the **Catppuccin Mocha** color palette:

```yaml
# Primary Colors
rosewater: "#f5e0dc"  # Light peachy pink
flamingo:  "#f2cdcd"  # Light salmon
pink:      "#f5c2e7"  # Soft pink
mauve:     "#cba6f7"  # Purple
red:       "#f38ba8"  # Warm red
maroon:    "#eba0ac"  # Dark red
peach:     "#fab387"  # Orange
yellow:    "#f9e2af"  # Warm yellow
green:     "#a6e3a1"  # Soft green
teal:      "#94e2d5"  # Cyan-green
sky:       "#89dceb"  # Light blue
sapphire:  "#74c7ec"  # Bright blue
blue:      "#89b4fa"  # Primary blue
lavender:  "#b4befe"  # Light purple

# Text Colors
text:      "#cdd6f4"  # Primary text
subtext1:  "#bac2de"  # Secondary text
subtext0:  "#a6adc8"  # Tertiary text

# Surface Colors
surface2:  "#585b70"  # Dark surface
surface1:  "#45475a"  # Darker surface
surface0:  "#313244"  # Primary surface
base:      "#1e1e2e"  # Background
mantle:    "#181825"  # Dark background
crust:     "#11111b"  # Darkest background
```

## ⚙️ Configuration Details

### File Structure
```
windots/
├── .config/
│   ├── .glzr/glazewm/
│   │   └── config.yaml          # GlazeWM configuration
│   ├── yasb/
│   │   ├── config.yaml          # YASB bar configuration
│   │   └── styles.css           # Custom Mocha styling
│   ├── wezterm/
│   │   └── .wezterm.lua         # WezTerm configuration
│   ├── windows-terminal/
│   │   └── settings.json        # Windows Terminal settings
│   ├── fastfetch/
│   │   └── config.jsonc         # System fetch configuration
│   └── Powershell/
│       └── Microsoft.PowerShell_profile.ps1
└── README.md
```

### Key Features per Component

#### GlazeWM Configuration
- **Workspace management**: 9 workspaces with smart application routing
- **Window rules**: Specific applications auto-assigned to workspaces
- **Keybindings**: Intuitive shortcuts for window and workspace management
- **Integration**: Seamless YASB startup and shutdown

#### YASB Configuration
- **Blur effects**: Modern translucent appearance
- **Responsive design**: Adapts to screen resolution
- **Widget customization**: Each widget styled with Mocha colors
- **Performance**: Lightweight with minimal resource usage

#### Terminal Configurations
- **Font**: Cascadia Code NF with ligatures
- **Color accuracy**: True Catppuccin Mocha implementation
- **Performance**: Optimized for speed and responsiveness
- **Features**: Tab management, splits, and custom key bindings

## 🔧 Customization

### Modifying Colors
All color definitions are centralized in each configuration file. Look for the Catppuccin color variables at the top of:
- `glazewm/config.yaml`
- `yasb/styles.css`
- `wezterm/.wezterm.lua`

### Adding Widgets to YASB
Edit `yasb/config.yaml` to add new widgets. Available widgets include:
- Weather information
- Spotify/media controls
- System performance graphs
- Custom PowerShell script outputs

### PowerShell Customization
The profile includes functions for easy customization:
- Add aliases in the "Custom Aliases" section
- Modify prompt appearance
- Add new modules to the auto-install list

## 🆘 Troubleshooting

### Common Issues

1. **GlazeWM not starting**
   ```powershell
   # Check if GlazeWM is in PATH
   glazewm --version
   
   # If not found, reinstall via Scoop
   scoop uninstall glazewm
   scoop install glazewm
   ```

2. **YASB not appearing**
   ```powershell
   # Manually start YASB to check for errors
   yasb
   
   # Check configuration syntax
   python -m yasb --validate-config
   ```

3. **PowerShell profile errors**
   ```powershell
   # Reset profile if corrupted
   Remove-Item $PROFILE -Force
   Copy-Item .config\Powershell\Microsoft.PowerShell_profile.ps1 $PROFILE
   ```

4. **Font issues in terminals**
   - Install **Cascadia Code NF** from [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts/releases)
   - Ensure font is selected in terminal settings

### Performance Optimization

- **Disable unnecessary YASB widgets** if experiencing lag
- **Reduce blur effects** in YASB configuration for older hardware
- **Limit PowerShell history** size in profile for faster startup

## 📚 Additional Resources

- [Catppuccin Theme](https://github.com/catppuccin/catppuccin) - Main theme repository
- [GlazeWM Documentation](https://github.com/glzr-io/glazewm) - Window manager docs
- [YASB Documentation](https://github.com/denBot/yasb) - System bar documentation
- [WezTerm Documentation](https://wezfurlong.org/wezterm/) - Terminal configuration guide

## 🤝 Contributing

Feel free to:
- **Fork this repository** and adapt it to your needs
- **Submit issues** for bugs or improvement suggestions
- **Share your modifications** to help others
- **Suggest new widgets** or configuration improvements

## 📄 License

This configuration is released under the MIT License. Feel free to use, modify, and distribute as needed.

---

<div align="center">

**Enjoy your beautiful, cohesive Windows desktop! 🌸**

*Made with ❤️ and lots of ☕*

</div>
