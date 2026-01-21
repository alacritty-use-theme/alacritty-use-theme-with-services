# alacritty-use-theme-with-redshift

Change alacritty's theme based on the current time and locale

#### Provides: `alacritty-use-theme.target`, `alacritty-use-theme.timer`, `alacritty-use-theme.service`
#### Overview: 
`Systemd` starts the units (`alacritty-use-theme.target`, `alacritty-use-theme.timer`, `alacritty-use-theme.service`).

The timer is set to run every minute and calls the target, which will call the service. The service will get the latest state-of-the-sun via `Redshift` and will update the cached value if needed.


---
- [Docs](/docs/theme-switcher.md)
- [System Diagram](/docs/theme-switcher.md#chart)


