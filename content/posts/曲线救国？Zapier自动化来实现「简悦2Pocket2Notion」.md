---
title: "曲线救国？Zapier自动化来实现「简悦>Pocket>Notion」" #标题
date: 2023-07-18T10:35:25+08:00 #创建时间
lastmod: 2024-02-12T10:35:25+08:00 #更新时间
author: ["MaxLen"] #作者
tags:
- Notion
- Zapier
- 自动化
- 简悦
summary: "我购买了简悦高级版，但是无法使用开发者提供的一键保存到Notion的服务，但是我看到简悦可以保存到Pocket，此时我突发奇想……" #描述
weight: # 输入1可以顶置文章，用来给文章展示排序，不填就默认按时间排序
slug: "simpleread-pocket-notion-zapier"
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

## ⚙️正题：简悦>Pocket>Notion

我购买了简悦高级版，但是无法使用开发者提供的一键保存到Notion的服务，但是我看到简悦可以保存到Pocket，此时我突发奇想：可不可以让简悦保存到Pocket，然后再通过Pocket的API保存到Notion呢？

之前有过Notion自动化的经验，所以这次很轻车熟路地选择了Zapier来帮我实现自动同步（不仅如此，Zapier 还提供上百个平台的自动化方案，感兴趣的朋友可以去试试呐）

直接New Zap，我们第一个流程选pocket

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/20240212/image.65p457xxt3g0.webp)

事件选择「新物品」（谷歌生草翻译）

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/20240212/image.4ak0qwrzl9q0.png)

账户这里登入一下，「Pocket是 Zapier 的可靠合作伙伴。[您的凭据已加密并且可以随时删除](https://zapier.com/help/account/data-management/data-privacy-at-zapier#step-1)。」

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/20240212/image.xvaod6ozf9c.webp)

第二个行为我们选择notion，先连接一下账户

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/20240212/image.6rvybvezats0.png)

登陆完毕notion后这里可能会显示你没有任何数据库，不必怀疑是你的问题，等待一会就可以正常加载

> 我第一次弄的时候就是加载不出数据库，弄了好几遍不成功，然后去吃了顿饭，回来竟然就好了，不知道是谁的问题，反正大家也等等就对了

这段时间我们可以去notion中先把稍后再读创建好

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/20240212/image.30v6gq7iskq0.png)

行为是

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/20240212/image.5sy2qflukh80.png)

然后就可以选择你的notion中的稍后再读数据库了

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/20240212/image.1o1av0g2t3fk.webp)

我这样配置

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/20240212/image.3bn4lkc0yhg0.png)

然后可以进行Test，看下效果

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/20240212/image.9udzu9mm1kw.webp)

Okay!

---

## 🎵插曲：我想用Instapaper充当中间者

然而并不可以。

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/20240212/image.43ih4u30xt40.png)

Instapaper可没有提供那个API给我们用。

---

## 🕶外话

话说这个Zapier的玩法真多啊，还能把Rss往各种程序里导，甚至通过这个可以让Notion/Pocket/Instapaper等等工具变成RSS阅读器！

这些我们可以以后慢慢聊……
