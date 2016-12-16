# 权利保留

遵循**Openresty**的开源协议，欢迎大家转载、使用，转载请注明来源 https://github.com/BBD-RD/openresty-smart-panda/。

# 说明

这个是我们写的一个openresty lua模块化开发的框架，用来简化nginx的配置、规范开发过程、降低开发难度、减少代码耦合性、提高多人协同工作等。
这个版本暂时只支持rewrite、access、content、header_filter、body_filter、log、balance这些handler，init和init_work也可以通过类似的方式实现，如果需要请自行处理。这里为了简单明了的给大家一个框架方案，就没有包含这部分。

希望对大家有帮助，也欢迎大家讨论、交流，联系方式见下方。

# 联系作者

liang.li@sinobbd.com 李亮

yu.dong@sinobbd.com 董宇

jianwei.wang@sinobbd.com 王建伟

# 安装及使用
## 1. 下载代码

git clone https://github.com/BBD-RD/openresty-smart-panda

## 2. 代码文件夹结构

 ![image](https://github.com/BBD-RD/pictures_for_md/blob/master/%E6%A8%A1%E5%9D%97%E5%8C%96%E6%96%87%E4%BB%B6%E5%A4%B9%E7%BB%93%E6%9E%84.png)

```
configure文件       ：一键编译安装脚本

lua-module-master  ：lua模块化实现文件夹

openresty          ：原生开源代码

```

lua-module-master 文件夹结构

 ![image](https://github.com/BBD-RD/pictures_for_md/blob/master/20161216_lua_master%E7%BB%93%E6%9E%84.png)

```

lua_conf         : 存放自定义lua模块的配置

lua_modules_conf : lua模块化的配置文件

lua_include_conf : nginx include配置文件，将access_by_lua_file等指令封装

process_module   :  模块化实现，存放各个阶段实现代码

modules          :  存放自定义lua模块代码

```

## 3. 添加自定义的lua模块

######   (1)首先modules文件夹中创建lua模块文件夹,同时添加了两个lua模块，如下
 ![image](https://github.com/BBD-RD/pictures_for_md/blob/master/1216%E8%87%AA%E5%AE%9A%E4%B9%89lua%E6%88%AA%E5%9B%BE.png)

######   (2)其次在相应模块文件夹中加入模块实现代码
 ![image](https://github.com/BBD-RD/pictures_for_md/blob/master/%E7%BB%93%E6%9E%84tree%E5%9B%BE.png)
```

后缀为.example的为此lua模块的示例配置，如无需配置则不写示例

配置文件使用时将后缀去掉即可

以hello_body模块为例，  helllo_body.lua为此模块的入口文件

hello_body_content_handle函数为暴露给模块化的入口函数

```

入口文件:
 ![image](https://github.com/BBD-RD/pictures_for_md/blob/master/%E5%85%A5%E5%8F%A3%E6%96%87%E4%BB%B6.png)

配置文件:
![image](https://github.com/BBD-RD/pictures_for_md/blob/master/%E8%87%AA%E5%AE%9A%E4%B9%89%E9%85%8D%E7%BD%AE%E6%88%AA%E5%9B%BE.png)

######   (3)最后要在process_module/lua_module_master_modules.lua中注册需要添加的模块，如下图所示。

添加规则:
![image](https://github.com/BBD-RD/pictures_for_md/blob/master/%E6%A8%A1%E5%9D%97%E6%B7%BB%E5%8A%A0%E6%88%AA%E5%9B%BE.png)

如何注册hello_header 以及hello_body模块:
![image](https://github.com/BBD-RD/pictures_for_md/blob/master/%E6%A8%A1%E5%9D%97%E6%B7%BB%E5%8A%A0%E4%BF%AE%E6%AD%A3.png)

######   (4)使用时需要配置模块化配置，规则如下图所示。
模块化配置文件module_conf:
 ![image](https://github.com/BBD-RD/pictures_for_md/blob/master/module_conf%E5%AE%9E%E4%BE%8B.png)


```

根据由上到下的顺序执行

可以多个模块一同配置

允许重复引用同一模块

```

自定义lua模块配置，示例

 ![image](https://github.com/BBD-RD/pictures_for_md/blob/master/%E8%87%AA%E5%AE%9A%E4%B9%89%E9%85%8D%E7%BD%AE.png)


```

具体配置项以及类型需根据场景自行设定

开发的模块也可以不使用配置，只需要在module_conf 中将配置设定为nil即可

配置文件名称可以自定义，与module_conf中配置的相同即可

```

## 4. 编译安装

```

#在源码目录执行

chmod +x configure

./configure

make && make install

```

 *  默认安装目录为/usr/local/openresty，可 --prefix=   自定义安装目录

 * 安装完成后在nginx 目录下会生成一个lua_modules文件夹, 结构与lua-module-master相同
 

## 5. 示例配置

**分三部分：nginx配置、模块化配置、模块配置(用上述hello 模块作为示例)**

##### (1)nginx 配置：nginx安装目录下的nginx.conf


    lua_package_path "/usr/local/openresty/nginx/lua_modules/?.lua;?.lua;/usr/local/openresty/lualib/?.lua;";
    
    lua_code_cache   on;



    location /test {

        set $module_conf "/usr/local/openresty/nginx/lua_modules/lua_modules_conf/test_module_conf";

        include "/usr/local/openresty/nginx/lua_modules/lua_include_conf/include_location.conf";

    }

```
注意事项
 (1)set $module_conf 设定的为模块化配置的配置文件名，不加后缀.lua
 (2)module_conf在不同的location中可以使用不同的模块化配置文件，结构相同  名字不同
 (3)include文件封装的nginx配置指令，直接使用即可，不用修改
```


##### (2)lua模块化配置：在安装目录的lua_module_conf文件夹下创建test_module_conf.lua
 ![image](https://github.com/BBD-RD/pictures_for_md/blob/master/%E6%A8%A1%E5%9D%97%E5%8C%96%E9%85%8D%E7%BD%AE%E6%9C%80%E5%90%8E.png)

##### (3)自定义lua模块配置：在安装目录的lua_conf文件夹下创建的hello_body_config.lua
 ![image](https://github.com/BBD-RD/pictures_for_md/blob/master/%E9%85%8D%E7%BD%AE2.png)


#####  (4)运行结果：
 ![image](https://github.com/BBD-RD/pictures_for_md/blob/master/%E9%85%8D%E7%BD%AE3.png)

```
 (1)产生定制的响应内容     （hello_body 模块作用）
 (2)响应头中有期待的头部产生（hello_header模块作用）
```

## 6. 赶快加几个模块试试吧 ^_^



# 欢迎使用、转载、交流
