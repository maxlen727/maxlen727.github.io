---
title: "话说最近Gitalk和Valine被墙了" #标题
date: 2022-08-04T10:35:25+08:00 #创建时间
lastmod: 2024-02-12T10:35:25+08:00 #更新时间
author: ["MaxLen"] #作者
tags: 
- 小记
- 网站
summary: "我的博客转入Gridea以来一直使用的评论系统就是Gitalk，在使用Hexo时则是Valine。" #描述
weight: # 输入1可以顶置文章，用来给文章展示排序，不填就默认按时间排序
slug: "gitalk-valine-gfw"
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

我的博客转入Gridea以来一直使用的评论系统就是Gitalk，在使用Hexo时则是Valine。

然而最近Gitalk某个服务被墙了，用不了了。其实有解决办法，就是稍微复杂一些：搭建一个服务器，代替这个Gitalk服务。不过Github上就有现成的，可以直接使用。

不过我使用的是Gridea，我不想再去翻Gridea的代码了。索性转向Valine吧！

结果没想到Valine似乎也被墙了？貌似是因为LeanCloud国际版出问题了。。。

我还知道别的评论服务，但Gridea都没有集成就算了。不过Gridea搭载了Disqus这个评论老将。可惜这个服务也被墙了哈哈，不过我没想到Gridea搭载的竟然是改进过后的DisqusJS，这个可以在不用代理的情况下查看评论，但是想要评论还是得用代理。反正比前面两个好就行了。

OK，那就这样吧。
