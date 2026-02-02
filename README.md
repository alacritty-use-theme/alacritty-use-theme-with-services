# alacritty-use-theme-with-gnome-darkmode
[Demo of alacritty-use-theme-with-gnome-darkmode](/docs/demo.md)

## Install
`yay -S alacritty-toggle-theme-on-darkmode.git`

 After installing the package enable and start the systemd units
 `systemctl --user enable alacritty-listen-to-colorscheme.service` `systemctl --user start alacritty-listen-to-colorscheme.service`

## Usage

the service will listens for a dbus signal to change the Gnome's colorscheme.
The service will use `alacritty-use-theme` to automaticlly switch alacritty's
theme.

### Setup alacritty-use-theme
https://github.com/christophermca/alacritty-use-theme/blob/main/README.md

#### Set aliases `day` and `night`
Create an aliases file inside of your alacritty configuration `touch $HOME/.config/alacritty/themes/alaises.toml`

```
    # aliases.toml
    [aliases]
    day = "pencil-light"
    night = "default" # will use the default theme in alacritty
```

Click the "Dark Mode" button in the system menu

# alacritty-use-theme-with-redshift

Change alacritty's theme based on the current time and locale

### Provides: `alacritty-use-theme.target`, `alacritty-use-theme.timer`, `alacritty-use-theme.service`, `update-gtk-theme.service`
### Overview:
`Systemd` starts the units (`alacritty-use-theme.target`, `alacritty-use-theme.timer`, `alacritty-use-theme.service`).

The timer is set to run every minute and calls the target, which will call the service. The service will get the latest state-of-the-sun via `Redshift` and will update the cached value if needed.


---
- [Docs](/docs/theme-switcher.md)
- [System Diagram](/docs/theme-switcher.md#chart)


