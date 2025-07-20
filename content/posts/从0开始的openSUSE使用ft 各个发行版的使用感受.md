---
title: "从0开始的openSUSE使用ft.各个发行版的使用感受" #标题
date: 2023-07-22T10:35:25+08:00 #创建时间
lastmod: 2024-02-12T10:35:25+08:00 #更新时间
author: ["MaxLen"] #作者
tags: 
- Linux
summary: "这个选题是很早之前准备写的，拖了很久，赶紧把它写了吧！这几次openSUSE使用也给我留下了很深的印象。最适合我的发行版是什么？我的心中已经有了答案" #描述
weight: # 输入1可以顶置文章，用来给文章展示排序，不填就默认按时间排序
slug: "opensuse-nb"
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

## 🦎Part 1 : 从0开始的openSUSE使用

openSUSE在我使用Linux的过程中给我留下了极好的印象，我将它推荐给Linux新手和Linux老鸟，不论是想要简单使用Linux还是想要深入研究Linux的人，openSUSE都是极好的

### 0. openSUSE两个版本，我适合哪个？

openSUSE主要有两个版本：**Tumbleweed**和**Leap** 区别在于「滚动更新」与「稳定发行」

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/20240212/image.3ocou7md89a0.webp)

📢Tumbleweed，俗称风滚草，是滚动更新的发行版，会带来最新的软件包更新。及时同步上游的特性使它永远保持最新，用户可以享受到最新的功能和补丁（~~同时也会第一时间享受到新的Bug＆问题~~）；openQA的特性使得它即使是滚动发行但依然可以坚若磐石，不至于让用户遇到毁灭性的Bug。风滚草的滚动让它时用时新。🤔同时就我个人的使用经验来看，风滚草的软件包似乎稍微比Leap多那么一丢丢，并且openSUSE活跃的社区也使你在风滚草上遇到的问题可以被及时解决。✨推荐给所有非服务器用户，无32位版本

📢Leap，稳定发行的发行版。上游是SLE（即SUSE为企业提供的发行版），其稳定性可想而知。不会收到及时的内核及核心组件的更新，但在遇到漏洞时，Leap用户仍可获得到与风滚草同等速度的及时更新。另外Leap的内核是不随主线的，是SUSE自己维护的一个分支，即便如此，Leap的内核依然非常稳定。但是Leap在遇到大版本更新时需要手动处理软件包冲突关系，这其中可能会出现问题。🤔就我个人使用经验来说Leap也许不适合国内使用？因为它的很多软件源直接来自SLE，这走的是SUSE位于德国的服务器，国内访问经常失败（2022时的发现，不知现在是否有所改观呢？）✨推荐给希望长久稳定使用的用户，有32位版本

### 1. 安装

> 💡 应当准备一个至少8GB的U盘，重要数据请提前备份，制作安装盘过程中会清除U盘中的所有数据！

首先我们可以来到openSUSE的官网，选择你喜欢的版本点击安装

[The makers' choice for sysadmins, developers and desktop users.](https://www.opensuse.org/)

然后在Download一页中按照自己的处理器架构下载（一般都是64位了吧）：

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/20240212/image.7env2xbfs5s0.webp)

等待它下载完成的过程中我们可以先把U盘插进去了，先把它制作成Ventoy启动盘。

[Ventoy](https://www.ventoy.net/cn/index.html)

下载完Ventoy后解压zip并打开Ventoy2Disk，选择U盘后点击安装

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/20240212/image.1e524dwevww0.png)

等条走完就算是制作完毕了。然后就可以把下载完毕的openSUSE镜像直接拷到U盘里了。

然后我们可以直接在Windows里分个区，免得进了openSUSE安装环境再麻烦。

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/20240212/image.6oz37wyiceo0.webp)

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/20240212/image.1m0mvb90xx9c.webp)

找个空闲空间多的盘符选择压缩卷，40GB是安装的底线，要日用还是多弄点

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/20240212/image.864mx2wi89k.png)

然后重启电脑在BIOS界面引导入U盘中，就可以进入openSUSE的安装盘了，选择Installation

> （我不想再安装一遍了，截图来自哔哩哔哩：Geeko_Bilibili）

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/20240212/image.3kc57opzoh60.webp)

选择语言，键盘布局一般都是默认不用动

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/20240212/image.788h0ycrv0w0.webp)

在线软件源可以激活，并不会出现别的发行版“服务器在国外，国内成龟速”的诡异情况。具体SUSE是怎么解决这个问题的我们稍后再说。

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/20240212/image.16klxbdt68lc.webp)

这里是桌面选择，建议KDE Plasma，自定义性强且现代，并且KDE的研发人员多数都在SUSE公司工作，所以KDE在SUSE上是最合适的。

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/20240212/image.16ur12unda9s.webp)

分区自行调整，此步一定谨慎，小心数据灰飞烟灭，若想看详细分区步骤的可以去哔哩哔哩[原视频](https://www.notion.so/PowerShell-1-9057ba0c9012447b8a81b6ffba363538?pvs=21)

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/20240212/image.10e6fsndpdls.webp)

选时区后设置用户名和密码

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/20240212/image.512j3xzf8gk0.webp)

确认无误后就可以开始愉快的安装了

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/20240212/image.4xhqmwxqu000.png)

### 2. 来到openSUSE的世界后，你首先要做的几件事

**这些步骤最好是按照顺序做，否则会遇到一些蜜汁问题**

#### Step 1 .管理无用软件源

1. 我们打开软件菜单，搜索yast，
    ![image](https://github.com/maxlen727/picx-images-hosting/raw/master/20240212/image.m0cu86baddc.webp)

2. 单击软件源
    ![image](https://github.com/maxlen727/picx-images-hosting/raw/master/20240212/image.27kq59tph7o.webp)

3. 框框的软件源建议直接删除，对普通个人用户没用
    ![image](https://github.com/maxlen727/picx-images-hosting/raw/master/20240212/image.4wd2o94oam80.webp)
    注意URL中有hd字样的一定要删除（下图来自哔哩哔哩UP主，飞蚊话）
    ![image](https://github.com/maxlen727/picx-images-hosting/raw/master/20240212/image.4xv166diw8c0.png)

#### Step 2 .显卡驱动

**如果你是英伟达显卡：**

有没觉得安装完卡卡的？是否感受到了openSUSE的“厚重”（笑）

SUSE是极其注重版权的公司，不会预装闭源的英伟达显卡驱动，这里需要我们手动安装性能更好的闭源驱动。

[SDB:NVIDIA 驱动 - openSUSE Wiki](https://zh.opensuse.org/SDB:NVIDIA_驱动)

openSUSE的官方wiki已经写的非常清楚了，在SUSE下你可以轻松安装英伟达显卡驱动，并且风滚草在升级内核时会自动重新处理这部分，请放心使用！

**DLC：如果你同时是个笔记本用户**

[SDB:NVIDIA SUSE Prime - openSUSE Wiki](https://zh.opensuse.org/SDB:NVIDIA_SUSE_Prime)

SUSE Prime 提供了在 Intel 显卡和 NVIDIA 显卡之间切换的工具，它适用于启用了Optimus 技术的笔记本电脑。并可以发挥英伟达显卡全部的性能。

**如果你是AMD显卡或Intel显卡用户：**

那你可丝毫不用担心了，得益于AMD和Intel的开源支持，openSUSE会自动安装mesa驱动，无需烦心配置了。

#### Step 3 .配置PACKMAN软件源

packman是openSUSE为了绕开版权限制所提供的一个软件仓库，方便用户安装一些SUSE没有预装但实际使用中可能必要的程序。所以我们需要添加packman软件源

对于风滚草：

```bash
zypper ar -cfp 90 https://mirrors.ustc.edu.cn/packman/suse/openSUSE_Tumbleweed packman
```

对于Leap：

```bash
zypper ar -cfp 90 https://mirrors.ustc.edu.cn/packman/suse/openSUSE_Leap_$releasever packman
```

#### Step 4 .妈，我要刷B站！——解码器安装

安装完openSUSE后你是没法刷b站等等视频网站的，原因是SUSE非常重视版权，解码器也属于版权保护范围内，所以默认不预装。还需要手动安装。

这一步的解码器就是来自packman，所以没有做Step3去添加packman软件源就不能安装这些。

```bash
sudo zypper refresh
sudo zypper dist-upgrade --from packman --allow-vendor-change
sudo zypper install --from packman ffmpeg gstreamer-plugins-{good,bad,ugly,libav} libavcodec-full vlc-codecs
```

#### Step 5 .解锁openSUSE大杀器——opi

**O**pen Build Service **P**ackage **I**nstaller（简称opi），这类似于Arch Linux的AUR Helper，方便用户使用**O**pen **B**uild **S**ervice（简称OBS）构建的软件包。

```bash
sudo zypper install opi
```

### 3. Linux世界广阔

openSUSE的Wiki要多看，遇到问题应该先翻wiki

[openSUSE Wiki](https://zh.opensuse.org/首页)

靠wiki发家的Arch写的很好很详细，里面的内容大部分也都是Linux发行版通用的

[Arch Linux 中文维基](https://wiki.archlinuxcn.org/wiki/首页)

再推荐一个UP主：飞蚊话，它的主力系统就是openSUSE，同时分享有很多Linux小知识＆技巧。~~*把我带入openSUSE的人啊~*~~

[飞蚊话的个人空间-飞蚊话个人主页-哔哩哔哩视频](https://space.bilibili.com/268630727)

openSUSE Software 是opi的数据来源，若遇到opi终端内无法处理的事情可以去更直观的Software里看看

[openSUSE Software](https://software.opensuse.org/)

此外Ask Ubuntu、Arch BBS、openSUSE论坛也是极好的……

[Ask Ubuntu](https://askubuntu.com/)

[Arch Linux 中文论坛](https://bbs.archlinuxcn.org/)

[Arch Linux Forums](https://bbs.archlinux.org/)

[openSUSE 中文论坛](https://forum.suse.org.cn/)

[openSUSE Forums](https://forums.opensuse.org/)

---

## 🐧Part 2 : 各个发行版的使用感受

<aside>
⚠️ 仅是个人观点、主观臆断，请勿上纲上线

</aside>

### Manjaro

✨**优点**:Manjaro是基于Arch的发行版，软件数量没得说，并且极大简化了Arch的安装过程。Manjaro的grub会记住上次引导的位置，别的发行版也都可以调成这样，但Manjaro默认就是。软件带的很全，不用像openSUSE那样手动安装解码器之类的东西，英伟达闭源驱动也可以自动安装。哦对了，它的默认终端是zsh，而别的发行版更多的是bash

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/20240212/image.53p5kj1ch800.webp)

💣**缺点**:因为是基于Arch，所以AUR下来的软件包一些需要自行编译。这确实避免了一堆乱七八糟的问题，但想安装或者升级这些软件还要等待编译，尤其遇到大型软件，那真是尤为痛苦。关键大部分软件源码都在GitHub上，不开代理真的很难使用啊！并且编译时会安装编译环境和所需依赖，系统会逐渐越来越胖呢～

### Deepin

✨**优点**:国内最强不为过吧？早年间就在深耕Linux桌面操作系统，对一众国产硬件支持好。自己研发的桌面环境DDE很漂亮，但某些地方还是不如KDE舒坦。软件源因为在国内嘛，安装软件和升级也都方便，依托于debian的强大生态和Deepin富足的国内社区，遇到问题很容易被解决，同时软件也多（尤其是国内软件，甚至都为Deepin专门适配）自带的deepin-wine用来兼容exe软件也算是比较够用了。

💣**缺点**:DDE的bug是真多，我还卡死过几回。软件包老，不适合我这样爱折腾的人。自带的英伟达闭源驱动是残的。

### Ubuntu

✨**优点**:社区强大、软件包多。

💣**缺点**:我用不惯GNOME。Ubuntu不尊重上游。商业化Snap软件包很难受（貌似我很不待见Flatpak、Snap这种解决方案）。隐私收集狂。「内部错误」。背后的商业公司Canonical不令人讨喜。

### Mint

✨**优点**:非常易用！可以一键切换国内软件源，一键安装英伟达闭源驱动啥的，易用的不得了！**Cinnamon**桌面环境中规中矩，比KDE不足。各个地方调的也比较舒服。软件丰富、社区强大。

💣**缺点**:无

### Arch

✨**优点**:Keep It Simple, Stupid. 软件包多，用户生态极强，用户质量高，遇到问题合理提问很快会有人解答。

💣**缺点**:和Manjaro那边我遇到的问题是一样的。对了，还有一点：Arch的安装稍微有亿点复杂。

但怎么说呢，我还是很爱这个邪教的。

### Pop!OS

✨**优点**:自带英伟达闭源驱动被奉「佳话」，但现在很多发行版也都这么做了，变成基操了。虽然是GNOME，但是改的比原版好用。软件丰富。依托System76商业公司。

💣**缺点**：不自动安装grub引导。我还是不喜欢GNOME。配色有点丑。

### openSUSE

✨**优点**:有滚动更新的风滚草和稳定发行的Leap两个版本可供选择。非常注重版权和开源文化。社区强大，用户质量整体高。软件包数量尚可。免费提供给大家的Open Build Server是真棒。尊重上游。YaST好使。openQA让我内心踏实。依托SUSE商业公司。

💣**缺点：** 不自带编解码器和英伟达闭源驱动。系统安装时速度慢。

### ZorinOS

✨**优点：** 软件包多

💣**缺点：** 自己改的桌面环境虽然漂亮但还是用起来非常膈应。没什么特色的发行版。

### Fedora

✨**优点：** 稳定，软件包数量尚可。实力雄厚，Linus在用这个发行版。依托RetHat商业公司，初安装系统非常轻量

💣**缺点：** 生命周期短，dnf包管理器速度慢，默认的GNOME桌面并不好使