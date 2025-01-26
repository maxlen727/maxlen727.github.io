---
title: "让Windows 10自动切换深色模式" #标题
date: 2021-09-02T10:35:25+08:00 #创建时间
lastmod: 2024-02-12T10:35:25+08:00 #更新时间
author: ["MaxLen"] #作者
tags: 
- 微软
summary: "Windows 10中，你可以手动在设置中切换浅色or深色模式，但不能自动切换.那有没有办法让Windows 10自动切换深色模式呢？" #描述
weight: # 输入1可以顶置文章，用来给文章展示排序，不填就默认按时间排序
slug: "auto-darkmode-win10"
draft: false # 是否为草稿
comments: true #是否展示评论
showToc: true # 显示目录
TocOpen: true # 自动展开目录
hidemeta: false # 是否隐藏文章的元信息，如发布日期、作者等
disableShare: false # 底部不显示分享栏
showbreadcrumbs: true #顶部显示当前路径
cover:
    image: "" #图片路径：posts/tech/文章1/picture.png
    caption: "" #图片底部描述
    alt: ""
    relative: false
---

## 🚗引入

Windows 10中，你可以手动在设置中切换浅色or深色模式，但不能自动切换

Windows 10中，还有一个夜间模式，但它并不是“Dark Mode”，我更愿意称他为“护眼模式”。

那有没有办法让Windows 10自动切换深色模式呢？

---

## ⏲这个被你忽视的小功能：计划任务

### 二分之一

> 打开任务计划程序，如果你不知道它在哪里可以找到，你可以使用Windows+S打开搜索找到它但这里我们依然提供它的路径：控制面板 > 所有控制面板选项 > 管理工具

点击”创建基本任务”

![https://i.bmp.ovh/imgs/2021/08/b2bc70ecb18ff789.png](https://i.bmp.ovh/imgs/2021/08/b2bc70ecb18ff789.png)

![https://i.bmp.ovh/imgs/2021/08/c46d9d49f3a9212f.png](https://i.bmp.ovh/imgs/2021/08/c46d9d49f3a9212f.png)

![https://i.bmp.ovh/imgs/2021/08/f0f0821586d62e72.png](https://i.bmp.ovh/imgs/2021/08/f0f0821586d62e72.png)

![https://i.bmp.ovh/imgs/2021/08/101645260cd0d4da.png](https://i.bmp.ovh/imgs/2021/08/101645260cd0d4da.png)

![https://i.bmp.ovh/imgs/2021/08/a925587b4ab4384c.png](https://i.bmp.ovh/imgs/2021/08/a925587b4ab4384c.png)

在启动程序中，输入`reg.exe`，而参数则输入：

`add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize /v SystemUsesLightTheme /t REG_DWORD /d 0 /f`

![https://i.bmp.ovh/imgs/2021/08/c516ce3897975ffa.png](https://i.bmp.ovh/imgs/2021/08/c516ce3897975ffa.png)

唉？你以为好了？其实还没好，这只是切换了Windows为深色，而应用还不是深色，依法炮制，我们再创建一个计划程序，在启动程序中同样输入 `reg.exe`，参数输入：

`add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize /v AppsUseLightTheme /t REG_DWORD /d 0 /f`

**OK，至此，自动深色部分已经完成，接下来我们还需要让它自动变为浅色**

### 其余的二分之一

我们依然依法炮制：在启动程序中同样输入 `reg.exe`，参数输入：

`add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize /v SystemUsesLightTheme /t REG_DWORD /d 1 /f`

再创建另一个：在启动程序中同样输入 `reg.exe`，参数输入：

`add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize /v AppsUseLightTheme /t REG_DWORD /d 1 /f`

### 结束

至此，自动开启or关闭深色模式的方法就结束了！
