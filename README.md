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


