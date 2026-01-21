# alacritty-use-theme-with-redshift

Change alacritty's theme based on the current time and locale

#### Provides: `theme-switcher.service`
#### Overview: 
systemd starts the units (alacritty-use-theme.target, alacritty-use-theme.timer, alacritty-use-theme.service) The timer is set to run every minute and calls the target, which calls the service. The service will get the latest state-of-the-sun via `Redshift` and will update the config when needed.


---
- [Docs](/docs/theme-switcher.md)
- [System Diagram](/docs/theme-switcher.md#chart)


