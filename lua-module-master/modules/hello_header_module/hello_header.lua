--[[*************************************************************************
    > File Name: hello_header.lua
    > Author: fishgege
    > Mail: yu.dong@sinobbd.com
    > Created Time: 2016年 12月 07日 星期三
**************************************************************************]]

local _M       = { _VERSION = '0.01' }
local ngx      = ngx;

--[[*************************************************************************
    > function Name: hello_header_header_filter_handle
    > Author: dongyu
    > Mail: yu.dong@sinobbd.com
    > Created Time: 2016年 12月 07日 星期三
    > function: 设定响应header
**************************************************************************]]
function _M.hello_header_header_filter_handle(conf)

    ngx.header["Hello"] = "Nice to meet you!"

    return;

end

return _M;
