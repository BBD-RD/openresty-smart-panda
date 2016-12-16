.PHONY: all install clean

all:
	cd /home/hub_share/openresty/build/LuaJIT-2.1-20161104 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-std=gnu99 -DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/home/hub/luajit
	cd /home/hub_share/openresty/build/lua-cjson-2.1.0.4 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/home/hub_share/openresty/build/luajit-root/home/hub/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/home/hub/lualib LUA_MODULE_DIR=/home/hub/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd /home/hub_share/openresty/build/lua-redis-parser-0.12 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/home/hub_share/openresty/build/luajit-root/home/hub/luajit/include/luajit-2.1 LUA_LIB_DIR=/home/hub/lualib CC=cc
	cd /home/hub_share/openresty/build/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/home/hub_share/openresty/build/luajit-root/home/hub/luajit/include/luajit-2.1 LUA_LIB_DIR=/home/hub/lualib CC=cc
	cd /home/hub_share/openresty/build/nginx-1.11.2 && $(MAKE)

install: all
	cd /home/hub_share/openresty/build/LuaJIT-2.1-20161104 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-std=gnu99 -DLUAJIT_ENABLE_LUA52COMPAT' CC=cc PREFIX=/home/hub/luajit DESTDIR=$(DESTDIR)
	cd /home/hub_share/openresty/build/lua-cjson-2.1.0.4 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/home/hub_share/openresty/build/luajit-root/home/hub/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/home/hub/lualib LUA_MODULE_DIR=/home/hub/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd /home/hub_share/openresty/build/lua-redis-parser-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/home/hub_share/openresty/build/luajit-root/home/hub/luajit/include/luajit-2.1 LUA_LIB_DIR=/home/hub/lualib CC=cc
	cd /home/hub_share/openresty/build/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/home/hub_share/openresty/build/luajit-root/home/hub/luajit/include/luajit-2.1 LUA_LIB_DIR=/home/hub/lualib CC=cc
	cd /home/hub_share/openresty/build/lua-resty-dns-0.18 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/home/hub/lualib INSTALL=/home/hub_share/openresty/build/install
	cd /home/hub_share/openresty/build/lua-resty-memcached-0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/home/hub/lualib INSTALL=/home/hub_share/openresty/build/install
	cd /home/hub_share/openresty/build/lua-resty-redis-0.26 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/home/hub/lualib INSTALL=/home/hub_share/openresty/build/install
	cd /home/hub_share/openresty/build/lua-resty-mysql-0.17 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/home/hub/lualib INSTALL=/home/hub_share/openresty/build/install
	cd /home/hub_share/openresty/build/lua-resty-string-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/home/hub/lualib INSTALL=/home/hub_share/openresty/build/install
	cd /home/hub_share/openresty/build/lua-resty-upload-0.10 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/home/hub/lualib INSTALL=/home/hub_share/openresty/build/install
	cd /home/hub_share/openresty/build/lua-resty-websocket-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/home/hub/lualib INSTALL=/home/hub_share/openresty/build/install
	cd /home/hub_share/openresty/build/lua-resty-lock-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/home/hub/lualib INSTALL=/home/hub_share/openresty/build/install
	cd /home/hub_share/openresty/build/lua-resty-lrucache-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/home/hub/lualib INSTALL=/home/hub_share/openresty/build/install
	cd /home/hub_share/openresty/build/lua-resty-core-0.1.9 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/home/hub/lualib INSTALL=/home/hub_share/openresty/build/install
	cd /home/hub_share/openresty/build/lua-resty-upstream-healthcheck-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/home/hub/lualib INSTALL=/home/hub_share/openresty/build/install
	cd /home/hub_share/openresty/build/lua-resty-limit-traffic-0.01 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/home/hub/lualib INSTALL=/home/hub_share/openresty/build/install
	cd /home/hub_share/openresty/build/opm-0.0.2 && /home/hub_share/openresty/build/install bin/* $(DESTDIR)/home/hub/bin/
	cd /home/hub_share/openresty/build/resty-cli-0.16 && /home/hub_share/openresty/build/install bin/* $(DESTDIR)/home/hub/bin/
	cp /home/hub_share/openresty/build/resty.index $(DESTDIR)/home/hub/
	cp -r /home/hub_share/openresty/build/pod $(DESTDIR)/home/hub/
	cd /home/hub_share/openresty/build/nginx-1.11.2 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/home/hub/site/lualib $(DESTDIR)/home/hub/site/pod $(DESTDIR)/home/hub/site/manifest
	ln -sf /home/hub/nginx/sbin/nginx $(DESTDIR)/home/hub/bin/openresty

clean:
	rm -rf build
