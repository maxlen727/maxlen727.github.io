---
title: "Linux下新QQ Bug＆Fix一记" #标题
date: 2023-07-09T10:35:25+08:00 #创建时间
lastmod: 2024-02-12T10:35:25+08:00 #更新时间
author: ["MaxLen"] #作者
tags: 
- Linux
- QQ
summary: "最近再次开始用openSUSE，没想到遇到了这个头疼的问题（7月26日更新）" #描述
weight: # 输入1可以顶置文章，用来给文章展示排序，不填就默认按时间排序
slug: "linux-qq-bugs-crash"
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

<aside>
💡 openSUSE Tumbleweed 20230709

</aside>

理论上也适用于同样遇到问题的其它发行版。

---

## 其一：无法启动，直接崩溃

安装完新LinuxQQ后打开却不见界面，但是看见鼠标变QQ的图标跳动了几下，于是打开KDE的崩溃进程查看器，发现了一篇崩溃日志，但是看不懂是个啥。

遂用指令启动QQ，准备看看到底哪里出了问题，结果提示「非法指令」，无果。只得去搜索。

[腾讯官方下载的qq-appimage版本，打开群聊就会闪退 / 应用程序与桌面环境 / Arch Linux 中文论坛](https://bbs.archlinuxcn.org/viewtopic.php?id=13322)

[linuxqq 闪退，求解决办法](https://forum.suse.org.cn/t/topic/15820/5)

这里两篇讨论大概提到了无法启动的问题，是libvips-cpp.so.42这个库的问题。所以准备对libvips进行编译，发现SUSE的Software里面直接就有这个软件包。

[openSUSE Software](https://software.opensuse.org/package/libvips42)

那就直接拿来用了。安装后删除QQ自带的libvips-cpp.so.42就行了。

> ⚠️ 这是openSUSE Software中的包，理论上此包只能给SUSE系的发行版使用！其它发行版请自行查找适于你的包

---

## 其二：用几次后再打开过不了多久就闪退

这个问题其实在上面SUSE论坛和Arch论坛里的回复里面也提到了，解决办法：

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/image.5pd6psmfc0g0.webp)

这是一个比较粗暴的方法。当然了，这个闪退据说是热更新文件的影响（在Arch BBS中被这位提到）。所以按这个道理可以删除热更新文件解决。

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/image.135q4uj3zo74.webp)

然而热更新文件在哪里呢？这位带佬却表示不知道。

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/image.6wssm9igupc0.webp)

> 💡 另外补充：即使关闭了QQ的自动更新也不能完全解决问题。仍然会在几次使用后闪退。

**7月26日更新：**

我翻阅了AUR下的linuxqq反馈，看见大家也遇到过这个问题，并且大家商讨出了解决方案（不得不感叹Arch Users的神通广大啊！）

[AUR (en) - linuxqq](https://aur.archlinux.org/packages/linuxqq)

也就是依照这位所言，只删除crash_files文件夹下的文件就好了，并将其设为只读可以避免问题复现。

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/image.26648zyyk140.webp)

---

## 外话

以后在Linux中遇到的问题和各种自定义的操作还是记一记，否则某时候遇到奇怪问题时就会很无头绪。相信我，每一个Linux使用者都该有个日志本（除非你用nixOS）。
