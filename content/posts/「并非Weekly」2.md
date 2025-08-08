---
title: 「并非Weekly」2
summary: 又一个Vibe Coding的产品：XSnap; Zen浏览器美化：Browser as Glass; 试试Zed; 睡不够啊啊
date: 2025-08-03T21:23:47+08:00
lastmod: 2025-08-03T21:23:47+08:00
slug: weekly-2
tags:
  - 并非Weekly
  - Vibe Coding
  - 美化
  - Zen Browser
  - Zed
  - 睡觉
draft: false
---
## 又一个Vibe Coding的产品：XSnap

上次Weekly说到Vibe了一个热力图记事器[ChronoHeat](https://github.com/maxlen727/ChronoHeat)，紧接着我就又Vibe了一个产品——[XSnap](https://github.com/maxlen727/XSnap)。用途是将X上的Tweet转成美丽的分享图。

![XSnap-elonmusk-1949938925163962634(12)](https://maxlen727.github.io/picx-images-hosting/XSnap-elonmusk-1949938925163962634(12).96a1x9y3e7.webp)

起因是我上次写周报用了很多Tweet嘛，我发现网上大多数将Tweet转分享图的工具都在Elon Musk接手Twitter之后死翘翘了，唯一发现能用的就是上次Weekly里的Pikaso. 并且这个网站是收费的，免费额度只有5张图。

那我就试着自己Vibe一个。众所周知，在Elon Musk接手Twitter之后API就被限制得死死的，从官方拿数据就很不现实，并且我也怀疑Gemini的编码能力能不能做到这一步。所以我先让Gemini做了一个本地版的文章转分享图工具，检验之后再继续以此为基础加入获取X数据的能力。

自然而然的，很容易想到[FixupX](https://github.com/FxEmbed/FxEmbed)这个项目，可以绕过官方API拿到一些Tweet数据。我直接把这个项目的README.md扔给了Gemini, 结果还真的轻松实现了出来。

这次Vibe过程中遇到了一点小疑难杂症是我在本地测试XSanp没有问题，但是部署到GitHub Pages之后就不能用了，还以为是FixupX的限制，打开控制台之后提示资源被浏览器增强型隐私保护拦截了。我告诉Gemini之后，它表示这是一个同源策略的问题，使用[allOrigins](https://github.com/gnuns/allorigins)提供的公共代理服务请求FixupX之后就没问题了。

这次Vibe收获了同源策略相关的知识，以及不要无脑给浏览器开增强型隐私防护。

---
## Zen浏览器美化：Browser as Glass!

发现一个叫做[Zen Zero](https://www.sameerasw.com/zen)的项目，可以让Zen浏览器及部分网站拥有模糊效果，非常漂亮！整个浏览器就像一块玻璃一样。

![YouTube](https://maxlen727.github.io/picx-images-hosting/屏幕截图_20250808_102614.6f0zy2b7bw.webp)
![ChatGPT](https://maxlen727.github.io/picx-images-hosting/屏幕截图_20250808_102932.me2gtaso.webp)

这些是适配了的网站，没适配的网站就没办法完美透明化了，倒是可以强制使网站透明化，但有些网站会出现bug就是了。

---
## 试试Zed

我常用的代码编辑器从VS Code换到了Zed.

这个编辑器还没做出来的时候我就关注到了，毕竟是Atom原班人马的作品，声量就大一些嘛。更加值得注意的是这个编辑器的技术栈是Rust, 不像VS Code和Atom那些基于Web的和JetBrains家的笨笨Java. 并且它被设计之初就力图达到快速、高性能，它的界面全都是GPU加速渲染的，这非常酷。我打开它的时候就感受到了飞快的速度，设计也是超级简洁漂亮。

![Zed](https://maxlen727.github.io/picx-images-hosting/图片.2yyo5zliup.webp)

嗯，这个UI大概就是非常克制的美吧。我用JetBrains Mono换掉了Zen Plex Mono，它的默认字重偏细，但我想要稍微调粗一点点发现没有那么细分的字重。不过反正我觉得Zen Plex Mono也没有JetBrains Mono好看就是了。

Zed AI属于能用的水平，代码补全有一点点聪明，因为Zed AI对你的代码无论是预测还是修复，都是小小的改动，隔壁Copilot的大段大段的补全我实在感觉无法驾驭（当然，如果你喜欢Copilot的话，Zed也有原生内嵌的Copilot支持）。

常用的语言肯定都支持了，很多是内建的支持，不需要安装插件。写完代码按下保存的时候Zed会瞬间帮你格式化代码，在用VS Code的时候我从未意识到代码格式化之后竟然可以看起来这么爽快~

![插件](https://maxlen727.github.io/picx-images-hosting/图片.4qrn0wgsfx.webp)

插件市场也有一定规模了（虽然还是跟VS Code不可比），也提供MCP服务器安装。

下载Zed的时候也就是想玩玩，没想到这东西已经发展得这么成熟了，一下子就成为了我的主力编辑器（主要是快呀，Zed太快了）

Zed官方不提供Windows的支持（只有社区编译的版本），虽然没有Windows的支持，但是却有Linux的支持。就这个骨气我是很敬佩的。

---
## 睡不够啊啊

我也不知道为什么老是睡不够，每天睡7个小时实在还是很困。并且发现我只能睡7小时：如果早睡那就会早醒，醒了就睡不着了，有次差不多21点就去睡了，结果第二天醒来的时候发现是4点左右，那不还是7小时嘛（苦笑）；如果晚睡就会晚醒，总计睡眠时长还是7小时。

困倦但难眠。
