---
title: 「并非 Weekly」2
summary: 又一个 Vibe Coding 的产品：XSnap; Zen 浏览器美化：Browser as Glass; 试试Zed; 睡不够啊啊
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
## 又一个 Vibe Coding 的产品：XSnap

上次 Weekly 说到 Vibe 了一个热力图记事器 [ChronoHeat](https://github.com/maxlen727/ChronoHeat)，紧接着束束就又 Vibe 了一个产品——[XSnap](https://github.com/maxlen727/XSnap). 用途是将 X 上的 Tweet 转成美丽的分享图。

![XSnap-elonmusk-1949938925163962634(12)](https://maxlen727.github.io/picx-images-hosting/XSnap-elonmusk-1949938925163962634(12).96a1x9y3e7.webp)

起因是束束上次写周报用了很多 Tweet 嘛，束束发现网上大多数将 Tweet 转分享图的工具都在 Elon Musk 接手 Twitter 之后死翘翘了，唯一发现能用的就是上次 Weekly 里的 Pikaso. 并且这个网站是收费的，免费额度只有5张图。

那束束就试着自己 Vibe 一个。众所周知，在 Elon Musk 接手 Twitter 之后 API 就被限制得死死的，从官方拿数据就很不现实，并且束束也怀疑 Gemini 的编码能力能不能做到这一步。所以束束先让 Gemini 做了一个本地版的文章转分享图工具，检验之后再继续以此为基础加入获取 X 数据的能力。

自然而然的，很容易想到 [FixupX](https://github.com/FxEmbed/FxEmbed) 这个项目，可以绕过官方 API 拿到一些 Tweet 数据。束束直接把这个项目的 README.md 扔给了 Gemini, 结果还真的轻松实现了出来。

这次 Vibe 过程中遇到了一点小疑难杂症是束束在本地测试 XSanp 没有问题，但是部署到 GitHub Pages 之后就不能用了，还以为是 FixupX 的限制，打开控制台之后提示资源被浏览器增强型隐私保护拦截了。束束告诉 Gemini 之后，它表示这是一个同源策略的问题，使用 [allOrigins](https://github.com/gnuns/allorigins) 提供的公共代理服务请求 FixupX 之后就没问题了。

这次 Vibe 收获了同源策略相关的知识，以及明白了浏览器的增强型隐私防护究竟会做什么。

---
## Zen 浏览器美化：Browser as Glass!

束束发现了一个叫做 [Zen Zero](https://www.sameerasw.com/zen) 的项目，可以让 Zen 浏览器及部分网站拥有模糊效果，非常漂亮！整个浏览器就像一块玻璃一样。

![YouTube](https://maxlen727.github.io/picx-images-hosting/屏幕截图_20250808_102614.6f0zy2b7bw.webp)
![ChatGPT](https://maxlen727.github.io/picx-images-hosting/屏幕截图_20250808_102932.me2gtaso.webp)

这些是适配了的网站，没适配的网站就没办法完美透明化了，倒是可以强制使网站透明化，但有些网站会出现 bug 就是了。

---
## 试试 Zed

束束把自己常用的代码编辑器从 VS Code 换到了 Zed.

这个编辑器还没做出来的时候束束就关注到了，毕竟是 Atom 原班人马的作品，声量就大一些嘛。更加值得注意的是这个编辑器的技术栈是 Rust, 不像 VS Code 和 Atom 那些基于 Web 的和 JetBrains 家的笨笨 Java. 并且它被设计之初就力图达到快速、高性能，它的界面全都是 GPU 加速渲染的，这非常酷。束束打开它的时候就感受到了飞快的速度，设计也是超级简洁漂亮。

![Zed](https://maxlen727.github.io/picx-images-hosting/图片.2yyo5zliup.webp)

嗯，这个 UI 大概就是非常克制的美吧。束束用 JetBrains Mono 换掉了 Zen Plex Mono, 它的默认字重偏细，但束束想要稍微调粗一点点发现没有那么细分的字重。不过反正束束觉得 Zen Plex Mono 也没有 JetBrains Mono 好看就是了。

Zed AI 属于能用的水平，代码补全有一点点聪明，因为 Zed AI 对你的代码无论是预测还是修复，都是小小的改动，隔壁 Copilot 的大段大段的补全束束实在感觉无法驾驭（当然，如果你喜欢 Copilot 的话，Zed 也有原生的 Copilot 支持）。

常用的语言肯定都支持了，很多是内建的支持，不需要安装插件。写完代码按下保存的时候 Zed 会瞬间帮你格式化代码，在用 VS Code 的时候束束从未意识到代码格式化之后竟然可以看起来这么爽快~

![插件](https://maxlen727.github.io/picx-images-hosting/图片.4qrn0wgsfx.webp)

插件市场也有一定规模了（虽然还是跟 VS Code 不可比），也提供 MCP 服务器安装。

下载 Zed 的时候也就是想玩玩，没想到这东西已经发展得这么成熟了，一下子就成为了束束的主力编辑器（主要是快呀，Zed 太快了）

Zed 官方暂时不提供 Windows 的支持（只有社区编译的版本）。虽然没有 Windows 的支持，但是却有 Linux 的支持。就这点束束是很敬佩的。

---
## 睡不够啊啊

束束也不知道为什么老是睡不够，每天睡 7 个小时实在还是很困。并且发现自己只能睡 7 小时：如果早睡那就会早醒，醒了就睡不着了，有次差不多 21 点就去睡了，结果第二天醒来的时候发现是 4 点左右，那不还是 7 小时嘛（苦笑）；如果晚睡就会晚醒，总计睡眠时长还是 7 小时。

困倦但难眠。
