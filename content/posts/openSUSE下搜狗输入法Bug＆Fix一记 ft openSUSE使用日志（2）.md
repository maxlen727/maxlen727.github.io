---
title: "openSUSE下搜狗输入法Bug＆Fix一记 ft. openSUSE使用日志（2）" #标题
date: 2023-07-23T10:35:25+08:00 #创建时间
lastmod: 2024-02-12T10:35:25+08:00 #更新时间
author: ["MaxLen"] #作者
tags:
- Linux
- 小记
- 搜狗输入法
- openSUSE
summary: "Linux下几乎就没有什么好用的拼音输入法。sunpinyin，四叶草拼音啥的都试过，还是种种不舒畅。最后想到搜狗输入法，然而这货想在openSUSE下正常使用可还得花点功夫。并且解决方法还比较“偏僻”，这是我的解决思路和经验，估计能对你起到一些帮助" #描述
weight: # 输入1可以顶置文章，用来给文章展示排序，不填就默认按时间排序
slug: "opensuse-sogou-log-2"
draft: false # 是否为草稿
comments: true #是否展示评论
showToc: false # 显示目录
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

<aside>
💡 本机环境：openSUSE 风滚草 + KDE

</aside>

---

先把输入法安装了再说：

```bash
opi sogou
```

装完是没法使用的，不仅如此，如果在fcitx里切换到它还会一直报错。

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/image.5cmn11yxcvs0.webp)

显然这可不是删除.config里的文件就能解决的，根据经验，先去openSUSE论坛里查查是怎么事？

[搜狗输入法异常！请删除.config/SogouPY 并重启](https://forum.suse.org.cn/t/topic/10208/3)

[解决搜狗输入法在某些linux系统下不能输入汉字的方法！](https://forum.suse.org.cn/t/linux/4773)

[安装搜狗输入法 2.3.1.0112 成功](https://forum.suse.org.cn/t/topic/12467)

这里有三则相关的内容，我依照里面的内容，尝试安装libQtWebKit4

```bash
sudo zypper in libQtWebKit4
```

然而并不能行。但大致了解到可能是缺少依赖所致。遂尝试用终端运行查找问题。

openSUSE论坛中这位提到了搜狗输入法包名为sogouqimpanel

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/image.2m0f6cn4pf80.webp)

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/image.t3vchll5bnk.webp)

其实正确包名是sogou-qimpanel

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/image.6pvvltu7dy80.webp)

这里运行之后很明显看出少了[libfcitx-qt.so.0](https://pkgs.org/download/libfcitx-qt.so.0()(64bit))运行库，遂去查找

pkgs这里虽没有openSUSE的，但作为Fedora的“亲戚”，我们还是可以借用一下它的rpm包的

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/image.2wzczg9j7w60.webp)

然而安装此包是却又遇到了另一个依赖问题，无奈，继续找包

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/image.74efcn9olx80.webp)

在这里寻到

[RPM resource liblua-5.4.so()(64bit)](https://rpmfind.net/linux/rpm2html/search.php?query=liblua-5.4.so()(64bit))

其实pkgs中也有这个包，但我尝试之后发现并不能解决，而RPM resource网站里的则可以，所以用它了。

再次尝试启动后又报错，仍然少依赖

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/image.69vv34ugnu80.webp)

只得再去寻找

[RPM resource libidn.so.11()(64bit)](https://rpmfind.net/linux/rpm2html/search.php?query=libidn.so.11()(64bit))

这个包也是pkgs里有，但安装后不能解决问题，所以还是来RPM resource里找。

这个库安装后就算是终于解决了，至此你的搜狗拼音输入法就可以正常使用了

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/image.63vfts8rg9o0.webp)
