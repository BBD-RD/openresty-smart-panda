--[[*************************************************************************
     > File Name: balancer_module_conf.lua
     > Author: dongyu
     > Mail: yu.dong@sinobbd.com
**************************************************************************]]

local modules = require "process_module.lua_module_master_modules";

local conf_modules = {
    --example1
    {
        enable = true,           -- true or false
        module = modules.test1,
        config_name = nil,
        module_dir = "",
    },

    --example2
    {
        enable = true,
        module = modules.test2,
        config_name = "test2_config",
        module_dir = "/usr/local/openresty/nginx/lua_module_master/",
    },

}

return conf_modules;
