--[[*************************************************************************
     > File Name: rewrite_process.lua
     > Author: DongYu
     > Mail: yu.dong@sinobbd.com
**************************************************************************]]

if not ngx.var.module_conf or type(ngx.var.module_conf) ~= "string" then
    ngx.log(ngx.ERR,"moduler must set module_conf's path");
    ngx.exit(500);
end

local modules = require(ngx.var.module_conf);

local luafile = nil;
local config  = nil;
local conf    = nil;

for _, v in ipairs(modules)
do
    if v.enable then

        if v.config_name then
            if type(v.config_name) ~= "string" then
                ngx.log(ngx.ERR,"config_name must set string");
                ngx.exit(500);
            end

            if type(v.module_dir) ~= "string" then
                ngx.log(ngx.ERR,"moduler must set module_dir");
                ngx.exit(500);
            end

            if string.byte(v.config_name) == string.byte("/") then
                config = v.config_name;
            else
                config = v.module_dir..v.config_name;
            end
        end

        if v.module.rewrite then
            --拼接执行文件名
            luafile = v.module.filename;
            --require 方式进行执行代码
            local md = require(luafile);
            if not md then
                ngx.log(ngx.ERR,"luafile is nil", luafile);
                ngx.exit(500);
            end
            local handle = v.module.rewrite;
            if handle then
                if config then
                    conf = require(config);
                end
                md[handle](conf);
            end

        end

    end

end
