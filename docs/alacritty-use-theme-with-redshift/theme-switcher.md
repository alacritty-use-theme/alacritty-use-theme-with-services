---
dependencies: bin/alacritty-use-theme, systemd, redshift
version: 1
---
This uses systemd units
- Services
- Timers
- Targets

# services
 ## alacritty-use-theme.service
 **Overview:** `systemd` starts the alacritty-use-theme unit (`alacritty-use-theme.target`, `alacritty-use-theme.timer`, `alacritty-use-theme.service`)
	  The timer is set **to run every minute** and calls the target, which calls the service.
	  The service will get the latest state of the sun via Redshift and updates the config if needed.

## CHART

``` mermaid
graph LR

%%Setup Objects%%
ENV@{shape: doc, label: ".config/alacritty-use-theme/environment.env"}
file.mode@{shape: bow-rect, label: ".config/alacritty-use-theme/mode"}
sharedVars@{shape: doc, label: ".local/alacritty-use-theme/src/shared-variables"}
updateGDM1@{label: .local/alacritty-use-theme/bin/update-gdm.sh}
alacrittyHelper@{shape: stadium, label: ".local/share/alacritty/configure/configure-colors.sh"}
alacritty-use-theme@{label: ".local/alacritty-use-theme/alacritty-use-theme.sh"}
timer[alacritty-use-theme.timer]
target@{label: "alacritty-use-theme.target"}
Systemd@{shape: stadium, label: Systemd}
Redshift@{shape: subproc, label: redshift}
geoclue@{shape: decision, label: geoclue-api}
sunset@{label: ".local/alacritty-use-theme/bin/get-sunrise-sunset" }


subgraph TimeBased
	comment@{shape: comment, label: Timer will run every minute}
	target ---> timer
	timer  ---> alacritty-use-theme.service
	target ---> update-gdk-theme.service
	alacritty-use-theme.service
end

alacritty-use-theme.service --> alacritty-use-theme

subgraph App["Application"]
	ENV
	sunset
	alacritty-use-theme --> sunset
	sunset -- "should save state" ----> IF{IF file.mode != redshift.mode}
	IF -- yes --> file.mode
	IF -- no -->  option-b@{shape: dbl-circ, label: Does nothing}
	updateGDM1
	sharedVars
	subgraph uGDM ["UpdatesGDM .local/share/alacritty-use-theme"]
		CONDITIONAL_CHECK_OS{"Checks if known Display Manager"}
		CONDITIONAL_CHECK_OS -- GDM --> .local/share/alacritty-use-theme/toggle-theme-per-mode ---> alacrittyHelper
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
