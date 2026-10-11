---
title: openSUSE 下搜狗输入法 Bug＆Fix 一记 ft. openSUSE 使用日志（2）
date: 2023-07-23T10:35:25+08:00
lastmod: 2024-02-12T10:35:25+08:00
author:
  - MaxLen
tags:
  - Linux
  - 小记
  - 搜狗输入法
  - openSUSE
summary: Linux 下几乎就没有什么好用的拼音输入法。sunpinyin, 四叶草拼音之类的都试过，还是种种不舒畅。最后想到搜狗输入法，然而它想在 openSUSE 下正常使用可还得花点功夫。
weight:
slug: opensuse-sogou-log-2
draft: false
comments: true
showToc: false
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
束束最近在整理自己的文章，这篇应该过旧了......可能没有看的必要了，但是还是不舍得删掉，毕竟那也是束束自己探索 Linux 的痕迹啊

---

先把输入法安装了再说：

```bash
opi sogou
```

装完是没法使用的，不仅如此，如果在 fcitx 里切换到它还会一直报错。

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/image.5cmn11yxcvs0.webp)

显然这可不是删除 .config 里的文件就能解决的，先去 openSUSE 论坛里查查是怎么回事吧？

[搜狗输入法异常！请删除 .config/SogouPY 并重启](https://forum.suse.org.cn/t/topic/10208/3)

[解决搜狗输入法在某些 linux 系统下不能输入汉字的方法！](https://forum.suse.org.cn/t/linux/4773)

[安装搜狗输入法 2.3.1.0112 成功](https://forum.suse.org.cn/t/topic/12467)

这里有三则相关的内容，依照里面的内容，尝试安装 libQtWebKit4

```bash
sudo zypper in libQtWebKit4
```

然而并不能行。但大致了解到可能是缺少依赖所致。遂尝试用终端运行查找问题。

openSUSE 论坛中这位提到了搜狗输入法包名为 sogouqimpanel

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/image.2m0f6cn4pf80.webp)

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/image.t3vchll5bnk.webp)

其实正确包名是 sogou-qimpanel

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/image.6pvvltu7dy80.webp)

这里运行之后很明显看出少了 [libfcitx-qt.so.0](https://pkgs.org/download/libfcitx-qt.so.0()(64bit)) 运行库，遂去查找

pkgs 这里虽没有 openSUSE 的，但作为 Fedora 的“亲戚”，我们还是可以借用一下它的 rpm 包的

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/image.2wzczg9j7w60.webp)

然而安装此包是却又遇到了另一个依赖问题，无奈，继续找包

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/image.74efcn9olx80.webp)

在这里寻到

[RPM resource liblua-5.4.so()(64bit)](https://rpmfind.net/linux/rpm2html/search.php?query=liblua-5.4.so()(64bit))

其实 pkgs 中也有这个包，但束束尝试之后发现并不能解决，而 RPM resource 网站里的则可以，所以用它了。

再次尝试启动后又报错，仍然少依赖

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/image.69vv34ugnu80.webp)

只得再去寻找

[RPM resource libidn.so.11()(64bit)](https://rpmfind.net/linux/rpm2html/search.php?query=libidn.so.11()(64bit))

这个包也是 pkgs 里有，但安装后不能解决问题，所以还是来 RPM resource 里找。

这个库安装后就算是终于解决了，至此搜狗拼音输入法就可以正常使用了

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/image.63vfts8rg9o0.webp)
