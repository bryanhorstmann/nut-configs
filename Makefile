.PHONY: install-all install-bin install-config install-cron restart-services redeploy-all

install-all: install-bin install-config install-cron

install-bin:
	sudo cp ./bin/upssched-cmd /usr/bin/

install-config:
	sudo cp ./config/* /etc/nut/

install-cron:
	sudo cp ./cron/disable_beeper.sh /etc/cron.hourly/

redeploy-all: install-all restart-services

restart-services:
	sudo systemctl restart nut-server.service
	sudo systemctl restart nut-monitor.service
