# NUT Configs
My configs and setup to get NUT running on my ubuntu desktop with an Mecer ME-2000-VU.

This guide previously contained instructions on setting up an Eaton 5E. Those can be found in the [eaton-5e](https://github.com/bryanhorstmann/nut-configs/tree/eaton-5e) tag.

## Configs
### bin
`upssched-cmd` replaces the pre-installed file. This will log a message to syslog when ups goes on battery or comes online. Also has a `upsonbatt` command to shutdown the NUT master.

### config
Mostly default configuration for UPS in standalone mode.

`upsmon.conf` calls `/bin/upssched` as a `NOTIFYCMD`. This ensures the configutaion in `upssched.conf` is executed.

### cron
The ups beeper does not stay off. Appears to turn back on after losing power or turning itself off. This is a simple cron that will check the current status and if the beeper is not disabled, disable it. Requires a few variables to be configured.

## Installation
To install everything in the correct directories and restart all services:
```
make redeploy-all
```
### Give nut group shutdown permissions
The `upssched` command is run as the nut user. In order to shutdown the host system, the nut user needs permissions to do so. Add the following to `/etc/sudoers`
```
# All nut group ability to shutdown server
%nut ALL=NOPASSWD: /sbin/shutdown
```

## Commands
### Get current status.
`upsc <upsname>`
```
→ upsc ups
Init SSL without certificate database
battery.charge: 100
battery.voltage: 27.40
battery.voltage.high: 26.00
battery.voltage.low: 20.80
battery.voltage.nominal: 24.0
device.type: ups
driver.name: blazer_usb
driver.parameter.pollinterval: 5
driver.parameter.port: auto
driver.parameter.synchronous: no
driver.parameter.vendorid: 0665
driver.version: 2.7.4
driver.version.internal: 0.12
input.current.nominal: 8.0
input.frequency: 50.1
input.frequency.nominal: 50
input.voltage: 237.1
input.voltage.fault: 237.1
input.voltage.nominal: 230
output.voltage: 237.1
ups.beeper.status: disabled
ups.delay.shutdown: 30
ups.delay.start: 180
ups.load: 2
ups.productid: 5161
ups.status: OL
ups.type: offline / line interactive
ups.vendorid: 0665
```

### List all possible commands
`upscmd -l <upsname>`
```
→ upscmd -l ups
Instant commands supported on UPS [ups]:

beeper.toggle - Toggle the UPS beeper
load.off - Turn off the load immediately
load.on - Turn on the load immediately
shutdown.return - Turn off the load and return when power is back
shutdown.stayoff - Turn off the load and remain off
shutdown.stop - Stop a shutdown in progress
test.battery.start - Start a battery test
test.battery.start.deep - Start a deep battery test
test.battery.start.quick - Start a quick battery test
test.battery.stop - Stop the battery test
```

### Disable the beeper
`upscmd <upsname> beeper.toggle`
```
→ upscmd ups beeper.toggle
Username (bryan): admin
Password:
OK
```
