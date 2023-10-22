---
title: Python基础——版本查看及第三方库操作
author: Myosotics
date: '2023-10-19'
slug: []
categories:
  - Coding
tags:
  - Python
---

# 版本查看

## 查看python版本

使用cmd命令查看(只能查看默认环境变量的python)。  
输入`win + r`进入命令窗口。输入`python`即可查看默认的 python 版本。
![](images/cmd_1.png)
或者输入`python --version`命令进行查看
![](images/cmd_python_version.png)

## 查看python的路径

在命令窗口中输入`where python`，它会显示python对应的路径，多个版本会显示多个路径
![](images/cmd_where_python.png)

## 默认的python版本就是cmd进入的python

首先查看高级系统设置并进入环境变量页面
![](images/senior_setting.png)
![](images/environment_variable.png)
查看环境变量的python。一般查看PATH变量。
![](images/check_path.png)

# 第三方库操作

## 查看第三方库

### 使用cmd命令查看(只能查看默认环境变量的python)

输入`win + r`进入命令窗口。输入`pip list`即可查看安装的第三方库。
![](images/cmd_pip_list.png)

### 通过安装的路径来看python的包

在命令窗口中输入`where python`，它会显示python对应的路径，多个版本会显示多个路径。
![](images/cmd_where_python.png)
复制进入对应python.exe的的上一级文件，此处我进入的是：`E:\software\Program Files\Python`
![](images/python_check_package_1.png)
之后一般第三方库的路径实在`.\Lib\site-packages`中。
![](images/check_package_place.png)





