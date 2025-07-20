---
title: "openSUSE下fcitx5 Bug＆Fix一小记 ft. openSUSE使用日志（3）" #标题
date: 2023-07-24T10:35:25+08:00 #创建时间
lastmod: 2024-02-12T10:35:25+08:00 #更新时间
author: ["MaxLen"] #作者
tags: 
- Linux
summary: "这是一篇小记。主要记下我的fcitx5的使用和遇到的问题。" #描述
weight: # 输入1可以顶置文章，用来给文章展示排序，不填就默认按时间排序
slug: "fcitx5-opensuse-bug"
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

## Bug＆Fix

书接上篇，我把openSUSE下的搜狗输入法搞好了，但是我还想使用最新版的，而不是M17N提供的旧版，但没想到我一乱搞就把fcitx弄坏了，突然想到fcitx5,便准备去用了。

安装了fcitx5后竟然无法在chrome中正常输入，我打开kate试试，发现可以输入，但唯独chrome无法输入。这是什么事？

我突然想到[之前读的liuf的文章](https://liuf.net/blog/2022/02/reason-i-like-fedora-over-opensuse/)中提到了fcitx5的输入问题，其原因大抵是ibus包导致的（没错，openSUSE竟然会默认同时带上ibus和fcitx包）

于是我就去卸载ibus包呗

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/image.1lj3wuje5gn4.webp)

这些个相关包我都卸载了，重启，果然fcitx5就好了。

然这个库是不能卸载的

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/image.45900rt7xqw0.webp)

因为

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/image.54x2iar1iy00.webp)

你也不想变成这样吧

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/image.5ju3bouwgtw0.webp)

---
## 使用经验

建议openSUSE安装到位后直接换成fcitx5,别用fcitx了。fcitx5已经并入风滚草主源了，尽量不要添加M17N这个源，否则以后会遇到一些问题（e.g. 装个steam反而自动把fcitx的依赖装进来了）

fcitx5非常好用，自带的拼音就很好了，没必要再用复杂的rime配置。只需要导入个词库就非常好用了。推荐一个[词库](https://github.com/wuhgit/CustomPinyinDictionary)，持续更新，非常好用，常用流行词啥的都有。有这个云拼音都不用开了，个人感觉输入效率不差搜狗输入法了。
