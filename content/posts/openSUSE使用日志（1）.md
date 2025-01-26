---
title: "openSUSE使用日志（1）" #标题
date: 2023-07-23T10:35:25+08:00 #创建时间
lastmod: 2024-02-12T10:35:25+08:00 #更新时间
author: ["MaxLen"] #作者
tags: 
- Linux
summary: "我曾经说过每个Linux使用者都该有写日志的好习惯，用以记录对系统的自定义更改。这是我的openSUSE使用日志（1）" #描述
weight: # 输入1可以顶置文章，用来给文章展示排序，不填就默认按时间排序
slug: "opensuse-log-1"
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

## 引导加载器切换为refind

YaST中

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/image.3zumrx03joc0.png)

使用官网提供的rpm包安装

---

## 系统代理设置

```bash
http 127.0.0.1:7890
socks5 127.0.0.1:7890
```

KDE设置中

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/image.38ued77mt1w0.png)

使用clash-verge，Meta内核

---

## 添加Chrome软件源并安装它

[Chrome - openSUSE Wiki](https://zh.opensuse.org/Chrome)

---

## 安装QQ并解决闪退问题

安装libvips42

[openSUSE Software](https://software.opensuse.org/package/libvips42)

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/image.1i12ovpsaqw0.png)

QQ官网下载rpm包，安装

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/image.1jq7yabyuyn4.webp)

缺少依赖项，Software寻到，安装

[openSUSE Software](https://software.opensuse.org/package/libuuid)

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/image.6q4n327040k0.webp)

此位置的运行库直接删掉，这样就会默认调用系统的

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/image.6lranbjfhrc0.webp)

此时就可以正常运行了

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/image.30n3sreppfo0.webp)
