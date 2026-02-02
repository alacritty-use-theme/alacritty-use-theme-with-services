# Configuring redshift

## Setting the provider
In your redshift config. eg (`$HOME/.config/redshift/redshift.conf`) set the
location-provider to `geoclue2` or `manual`
Use `location-provider=geoclue2` or `location-provider=manual`

### Manual provider
You must provide a lat and lng under the manual section of the `redshift.conf`

```
[manual]

lat=40.68
lng=-74.04
```

### geoclue2 provider
You will need to update geoclue.config (/etc/geoclue/geoclue.conf)

#### Determine which configuration option geoclue will use.
1. WIFI
Let your wifi connection determine your location.
```sh
# /etc/geoclue/geoclue.conf
[wifi]
enable=true
url=https://api.beacondb.net/v1/geolocate
```

2. Static-Source
This uses the location data found in `/etc/geolocation`. 

```sh
# /etc/geolocation
40.6893129  # latitude
-74.0445531 # longitude
96          # altitude
1.83        # accuracy radius (the diameter of the torch is 12 feet)
```

Inside of geoclue.conf update the configuration options as follows.
```conf
[static-source]
enable=true

; Give redshift premission to use geoclue.
[redshift]
allowed=true
system=false
users=
```

---

# From `man geoclue`

```
STATIC LOCATION FILE
Basic format:
The static location file in /etc (used by the static source) is a text file  consisting of the following:

1      Latitude (floating point number; positive values
        mean north, negative south)

2      Longitude (floating point number; positive
        values mean east, negative west)

3      Altitude (floating point number; in
        meters)

4      Accuracy radius (floating
        point number; in meters)

These values need to be
separated by newline
characters.

Additional format
information:
•      The '#' character starts a comment, which continues until the end of the current line.

• Leading and trailing white-space on each line is ignored.
• Empty lines (or containing just white-space or a comment) are ignored.

Example:
    # Example static location file for a machine inside Statue of Liberty torch

    40.6893129  # latitude
    -74.0445531 # longitude
    96          # altitude
    1.83        # accuracy radius (the diameter of the torch is 12 feet)

Notes: For extra security, the static location file can be made readable just by the geoclue user:

chown geoclue /etc/geolocation
chmod 600 /etc/geolocation
```
