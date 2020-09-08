# NUT Configs
My configs and setup to get NUT running on my ubuntu desktop with an Eaton 5E UPS.

## Configs
### bin
`upssched-cmd` replaces the pre-installed file. This will log a message to syslog when ups goes on battery or comes online. Also has a `upsonbatt` command to shutdown all load on UPS and then shutdown the UPS itself.

### config
Mostly default configuration for Eaton 5E in standalone mode.

`upsmon.conf` calls `/bin/upssched` as a `NOTIFYCMD`. This ensures the configutaion in `upssched.conf` is executed.

### cron
The ups beeper does not stay off. Appears to turn back on after losing power or turning itself off. This is a simple cron that will check the current status and if the beeper is not disbaled, disable it. Requires a few variables to be configured.

## Commands
### Get current status.
`upsc <upsname>`
```
→ upsc ups
Init SSL without certificate database
battery.charge: 100
battery.runtime: 1825
battery.type: PbAc
device.mfr: EATON
device.model: 5E 650i
device.type: ups
driver.name: usbhid-ups
driver.parameter.pollfreq: 30
driver.parameter.pollinterval: 5
driver.parameter.port: auto
driver.parameter.synchronous: no
driver.parameter.vendorid: 0463
driver.version: 2.7.4
driver.version.data: MGE HID 1.40
driver.version.internal: 0.41
input.voltage: 234.0
outlet.1.status: on
outlet.desc: Main Outlet
outlet.id: 1
outlet.switchable: no
output.frequency: 50.0
output.frequency.nominal: 50
output.voltage: 234.0
output.voltage.nominal: 230
ups.beeper.status: disabled
ups.delay.shutdown: 20
ups.firmware: 03.08.0018
ups.load: 20
ups.mfr: EATON
ups.model: 5E 650i
ups.power.nominal: 650
ups.productid: ffff
ups.start.battery: yes
ups.status: OL
ups.timer.shutdown: -1
ups.vendorid: 0463
```

### List all possible commands
`upscmd -l <upsname>`
```
→ upscmd -l ups
Instant commands supported on UPS [ups]:

beeper.disable - Disable the UPS beeper
beeper.enable - Enable the UPS beeper
beeper.mute - Temporarily mute the UPS beeper
beeper.off - Obsolete (use beeper.disable or beeper.mute)
beeper.on - Obsolete (use beeper.enable)
load.off - Turn off the load immediately
load.off.delay - Turn off the load with a delay (seconds)
shutdown.stop - Stop a shutdown in progress
```

### Disable the beeper
`upscmd <upsname> beeper.disable`
```
→ upscmd ups beeper.disable
Username (bryan): admin
Password:
OK
```

