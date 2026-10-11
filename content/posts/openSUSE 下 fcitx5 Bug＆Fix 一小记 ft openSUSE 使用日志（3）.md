---
title: openSUSE 下 fcitx5 Bug＆Fix 一小记 ft. openSUSE 使用日志（3）
date: 2023-07-24T10:35:25+08:00
lastmod: 2024-02-12T10:35:25+08:00
author:
  - MaxLen
tags:
  - Linux
  - openSUSE
  - fcitx5
summary: 这是一篇小记。主要记下束束 fcitx5 的使用和遇到的问题。
weight:
slug: fcitx5-opensuse-bug
draft: false
comments: true
showToc: true
TocOpen: true
hidemeta: false
disableShare: false
showbreadcrumbs: true
cover:
  image: ""
  caption: ""
  alt: ""
  relative: false
---
> 束猫！！我输入法呢？你再给我乱搞！

> 欸欸 对不起嘛！

---
## Bug＆Fix

书接上篇，束束把 openSUSE 下的搜狗输入法搞好了，但是还想使用最新版的，而不是 M17N 这个源提供的旧版，但没想到束束一乱搞就把 fcitx 弄坏了，突然想到 fcitx5, 便准备去用了。

安装了 fcitx5 后竟然无法在 chrome 中正常输入，束束打开 kate 试试，发现可以输入，但唯独 chrome 无法输入。这是怎么回事？

呃，好在束束喜欢在各种博客站里面乱逛，突然想到[之前读的 liuf 的文章](https://liuf.net/blog/2022/02/reason-i-like-fedora-over-opensuse/)中提到了 fcitx5 的输入问题，其原因大抵是 ibus 包导致的（没错，openSUSE 竟然默认同时带上 ibus 和 fcitx 包）

于是束束就去卸载 ibus 包呗（YaST 是对的！）

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/image.1lj3wuje5gn4.webp)

这些个相关包束束都卸载了，重启，果然 fcitx5 就好了。

然这个库......

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/image.45900rt7xqw0.webp)

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/image.54x2iar1iy00.webp)

突然想到了这个：

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/image.5ju3bouwgtw0.webp)

---
## 使用经验

建议 openSUSE 安装到位后直接换成 fcitx5, 别用 fcitx 了。fcitx5 已经并入风滚草主源了，尽量不要添加 M17N 这个源，否则以后会遇到一些问题（e.g. 装个 steam 反而自动把 fcitx 的依赖装进来了）

fcitx5 非常好用，自带的拼音就很好了，没必要再用复杂的 rime 配置。只需要导入个词库就非常好用了。推荐一个[词库](https://github.com/wuhgit/CustomPinyinDictionary)，持续更新，非常好用，常用流行词之类都有。有这个词库之后，云拼音都不用开了，束束个人感觉输入效率不差搜狗输入法了。