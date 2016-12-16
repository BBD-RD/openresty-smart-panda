
default:	build

clean:
	rm -rf Makefile objs

build:
	$(MAKE) -f objs/Makefile

install:
	$(MAKE) -f objs/Makefile install

modules:
	$(MAKE) -f objs/Makefile modules

upgrade:
	/home/hub/nginx/sbin/nginx -t

	kill -USR2 `cat /home/hub/nginx/logs/nginx.pid`
	sleep 1
	test -f /home/hub/nginx/logs/nginx.pid.oldbin

	kill -QUIT `cat /home/hub/nginx/logs/nginx.pid.oldbin`
