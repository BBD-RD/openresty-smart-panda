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

# 模块化使用以及编译安装

## 1. 下载代码

git clone https://github.com/BBD-RD/openresty-smart-panda

## 2. 代码文件夹结构

 ![image](https://github.com/BBD-RD/pictures_for_md/blob/master/%E6%A8%A1%E5%9D%97%E5%8C%96%E6%96%87%E4%BB%B6%E5%A4%B9%E7%BB%93%E6%9E%84.png)

```
configure文件       ：一键编译安装脚本

lua-module-master  ：lua模块化实现文件夹

openresty          ：原生开源代码

```

## 3. 如何实现lua模块化

添加模块

首先要在process_module/lua_module_master_modules.lua中注册需要添加的模块，如下图所示。

 ![image](https://github.com/BBD-RD/pictures_for_md/blob/master/%E6%A8%A1%E5%9D%97%E5%8C%96%E9%85%8D%E7%BD%AE%E6%96%87%E4%BB%B6.png)

示例：

 ![image](https://github.com/BBD-RD/pictures_for_md/blob/master/%E6%A8%A1%E5%9D%97%E5%8C%96%E9%85%8D%E7%BD%AE%E5%AE%9E%E4%BE%8B.png)



在lua-module-master文件夹中加入模块文件夹以及模块实现，如下图加入hello_module文件夹及其执行代码

 ![image](https://github.com/BBD-RD/pictures_for_md/blob/master/%E6%A8%A1%E5%9D%97%E6%B7%BB%E5%8A%A01.png)



 2.  配置文件

模块化配置文件  module_conf
 ![image](https://github.com/BBD-RD/pictures_for_md/blob/master/%E6%A8%A1%E5%9D%97%E6%B7%BB%E5%8A%A02.png)


```

根据由上到下的顺序执行

可以多个模块一同配置

允许重复引用同一模块

```

自定义模块配置，示例

 ![image](https://github.com/BBD-RD/pictures_for_md/blob/master/%E8%87%AA%E5%AE%9A%E4%B9%89%E9%85%8D%E7%BD%AE.png)


```

具体配置项以及类型需根据场景自行设定

开发的模块也可以不使用配置，只需要在module_conf 中将配置设定为nil即可

```

## 4. 编译安装

```

#在源码目录执行

chmod +x configure

./configure

make && make install

```

 *  默认安装目录为/usr/local/openresty，可 --prefix=   自定义安装目录

 * 安装完成后在nginx 目录下会生成一个lua_modules文件夹



## 5.lua_modules文件夹结构

 ![image](https://github.com/BBD-RD/pictures_for_md/blob/master/%E5%AE%89%E8%A3%85%E5%90%8E%E7%BB%93%E6%9E%84.png)




```

hello_module       示例lua模块，设定响应内容与响应头

lua_conf           lua模块的配置文件夹，存放各个lua功能模块的配置

lua_modules_conf   存放lua模块化的配置文件

lua_include_conf   存放include配置文件，将access_by_lua_file等指令封装

process_module     模块化实现，存放各个阶段实现代码

```

## 6. 示例配置

**分三部分：nginx配置、模块化配置、模块配置(用上述hello 模块作为示例)**

##### (1)nginx 配置：

    lua_package_path "/usr/local/openresty/nginx/lua_modules/?.lua;?.lua;/usr/local/openresty/lualib/?.lua;";

    lua_code_cache   on;



    location /test {

        set $module_conf "/usr/local/openresty/nginx/lua_modules/lua_modules_conf/test_module_conf";

        include "/usr/local/openresty/nginx/lua_modules/lua_include_conf/include_location.conf";

    }



##### (2)lua模块化配置：

 ![image](https://github.com/BBD-RD/pictures_for_md/blob/master/%E9%85%8D%E7%BD%AE1.png)

##### (3)自定义lua模块配置：


 ![image](https://github.com/BBD-RD/pictures_for_md/blob/master/%E9%85%8D%E7%BD%AE2.png)



#####  (4)运行结果：

 ![image](https://github.com/BBD-RD/pictures_for_md/blob/master/%E9%85%8D%E7%BD%AE3.png)



## 7. 赶快加几个模块试试吧 ^_^



# 欢迎使用、转载、交流
