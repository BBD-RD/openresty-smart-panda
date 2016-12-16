--[[*************************************************************************
    > File Name: hello_body.lua
    > Author: fishgege
    > Mail: yu.dong@sinobbd.com
    > Created Time: 2016年 12月 07日 星期三
**************************************************************************]]

local _M       = { _VERSION = '0.01' }
local ngx      = ngx;

--[[*************************************************************************
    > function Name: hello_body_content_handle
    > Author: dongyu
    > Mail: yu.dong@sinobbd.com
    > Created Time: 2016年 12月 07日 星期三
    > function: 设定响应内容
**************************************************************************]]
function _M.hello_body_content_handle(conf)

    if type(conf) ~= "table" then
        ngx.log(ngx.ERR,"log format: no config");
        return;
    end

    local txt = "This is a message send to";

    txt = txt.." "..conf.sendto;

    txt = txt.." from "..conf.from;

    ngx.say(txt);

    return;

end

return _M;
