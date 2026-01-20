---
resources:
version: 1
---
This uses systemd units
- Services
- Timers
- Targets

# services
 ## theme-switcher.service
 `systemd` starts the theme-switcher unit (`theme-switcher.target`, `theme-switcher.timer`, `theme-switcher.service`)
	  The timer is set **to run every minute** and calls the target, which calls the service.
	  The service will get the latest state of the sun via Redshift and updates the config if needed.

 ## alacritty-listen-to-colorscheme.service
 _Previously named as color-mode.service_
 - Built for the _Gnome Desktop Manager_
 - Uses alacritty-use-theme to set alacritty's theme at runtime.
 ## How it works  
 `systemd` will start the color-mode.service unit. The unit will monitor the system for a dbus signal matching the criteria: `type=signal interface=org.freedesktop.portal.Settings member="SettingChanged"`. If a signal has been found, we search the message for a specific term `color-scheme`. when the `color-scheme` is set to **prefer-dark** the system will favor darker themes, and when the `color-scheme` is either **default** or **prefer-light** the system will favor lighter themes
 
## CHART

``` mermaid
graph LR

%%Setup Objects%%
ENV@{shape: doc, label: ".config/theme-switcher/environment.env"}
file.mode@{shape: bow-rect, label: ".config/theme-switcher/mode"}
sharedVars@{shape: doc, label: ".local/theme-switcher/src/shared-variables"}
updateGDM1@{label: .local/theme-switcher/bin/update-gdm.sh}
alacrittyHelper@{shape: stadium, label: ".local/share/alacritty/configure/configure-colors.sh"}
theme-switcher@{label: ".local/theme-switcher/theme-switcher.sh"}
timer[theme-switcher.timer]
target@{label: "theme-switcher.target"}
Systemd@{shape: stadium, label: Systemd}
Redshift@{shape: subproc, label: redshift}
geoclue@{shape: decision, label: geoclue-api}
sunset@{label: ".local/theme-switcher/bin/get-sunrise-sunset" }


subgraph TimeBased
	comment@{shape: comment, label: Timer will run every minute}
	target ---> timer
	timer  ---> theme-switcher.service
	target ---> update-gdk-theme.service
	theme-switcher.service
end

theme-switcher.service --> theme-switcher

subgraph App["Application"]
	ENV
	sunset
	theme-switcher --> sunset
	sunset -- "should save state" ----> IF{IF file.mode != redshift.mode}
	IF -- yes --> file.mode
	IF -- no -->  option-b@{shape: dbl-circ, label: Does nothing}
	updateGDM1
	sharedVars
	subgraph uGDM ["UpdatesGDM .local/share/theme-switcher"]
		CONDITIONAL_CHECK_OS{"Checks if known Display Manager"}
		CONDITIONAL_CHECK_OS -- GDM --> .local/share/theme-switcher/toggle-theme-per-mode ---> alacrittyHelper
	end
end

subgraph geoclue
	geoclue-api@{shape: decision, label: } --use wifi--> locationService@{shape: cyl, label: "beaconDB"}
	geoclue-api --use static data--> geolocation@{shape: doc, label: "geolocation"}
	comment2@{shape: comment, label: 	"**geolocation** This is best option for location privacy and/or using a VPN"}
end

updateGDM1 ----> CONDITIONAL_CHECK_OS

update-gdk-theme.service ----> updateGDM1
Systemd ---> target
sunset -- "Get current state of sun (day/night)" ----> Redshift --> geoclue
```
