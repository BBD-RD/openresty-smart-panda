--[[*************************************************************************
     > File Name: module_conf.lua
     > Author: dongyu
     > Mail: yu.dong@sinobbd.com
**************************************************************************]]

local modules = require "process_module.lua_module_master_modules";

local conf_modules = {
    --example1
    {
        enable = true,           -- true or false
        module = modules.test1,  -- test1 为模块索引
        config_name = nil,       -- 配置文件
        module_dir = "",         -- 配置所在文件夹,选择使用     
    },

    --example2
    {
        enable = true,
        module = modules.test2,
        config_name = "test2_config",
        module_dir = "/usr/local/openresty/nginx/lua_module_master/lua_conf",
    },

}

return conf_modules;
