---
title: 曲线救国？Zapier 自动化来实现「简悦>Pocket>Notion」
date: 2023-07-18T10:35:25+08:00
lastmod: 2024-02-12T10:35:25+08:00
author:
  - MaxLen
tags:
  - Notion
  - Zapier
  - 自动化
  - 简悦
summary: 束束购买了简悦高级版，但是不知什么原因无法使用开发者提供的一键保存到 Notion 的服务，但是束束看到简悦可以保存到 Pocket, 此时束束突发奇想……
weight:
slug: simpleread-pocket-notion-zapier
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
束束真的迷恋于阅读互联网上散落的文章呢

---
## 正题：简悦>Pocket>Notion

束束购买了简悦高级版，但是不知道什么原因无法使用开发者提供的一键保存到 Notion 的服务，但是束束发现简悦可以保存到 Pocket, 这让束束突发奇想：可不可以让简悦保存到 Pocket, 然后再通过 Pocket 保存到 Notion 呢？

由于之前有过 Notion 自动化的经验，所以这次很轻车熟路地选择了 Zapier 来帮我实现自动同步（Zapier 还提供上百个平台的自动化方案，感兴趣的朋友可以去试试呐）

直接 New Zap，第一个流程选 pocket

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/20240212/image.65p457xxt3g0.webp)

事件选择「新物品」（谷歌生草翻译）

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/20240212/image.4ak0qwrzl9q0.png)

账户这里登入一下，「Pocket 是 Zapier 的可靠合作伙伴。[您的凭据已加密并且可以随时删除](https://zapier.com/help/account/data-management/data-privacy-at-zapier#step-1)」

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/20240212/image.xvaod6ozf9c.webp)

第二个行为选择 notion, 先连接一下账户

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/20240212/image.6rvybvezats0.png)

登陆完毕 notion 后这里可能会显示你没有任何数据库，嗯...这倒不必怀疑是你的问题，等待一会就可以正常加载

> 束束第一次弄的时候就是加载不出数据库，试了好几遍不成功，然后去吃了顿饭，回来竟然就好了，不知道是谁的问题，反正大家也等等就对了

这段时间我们可以去 notion 中先把稍后再读创建好

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/20240212/image.30v6gq7iskq0.png)

行为是

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/20240212/image.5sy2qflukh80.png)

然后就可以选择 notion 中的稍后再读数据库了

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/20240212/image.1o1av0g2t3fk.webp)

束束是这样配置的

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/20240212/image.3bn4lkc0yhg0.png)

然后可以进行 Test, 看下效果

![image](https://github.com/maxlen727/picx-images-hosting/raw/master/20240212/image.9udzu9mm1kw.webp)

这就可以了

---

## 尾巴

 Zapier 的玩法真多啊，还能把 RSS 往各种程序里导，甚至通过这个可以让 Notion/Pocket/Instapaper 等等工具变成 RSS 阅读器！

不过这些束束倒是暂时用不上啦，以后再慢慢看吧……
