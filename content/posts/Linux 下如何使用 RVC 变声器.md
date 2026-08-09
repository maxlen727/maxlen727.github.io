---
title: Linux 下如何使用 RVC 变声器
summary: 发现了一个 Linux 下的 RVC 的 TUI, 极大方便了使用变声器，分享一下这个好玩的项目
date: 2026-08-04T17:54:31+08:00
lastmod: 2026-08-04T17:54:31+08:00
slug: linux-rvc-woys
tags:
  - RVC
  - 变声器
  - woys
  - Linux
draft: false
---
{{< github repo="alirexha/woys" >}}

其实使用方法在仓库的 README 里面已经写的很清楚了

本质 Voice Changer, 把多余的跨平台代码都剔除掉了，仅仅保留 Linux 部分，仅支持 RVC 模式，是个极其轻量的 TUI. 还可以 RNNoise 处理降噪。

硬件要求上，此项目仅支持 CUDA 推理，所以可能把 AMD 和 Intel 显卡的用户排除掉了（貌似听说过一些 CUDA 兼容层存在，但具体情况没有了解过）。并且没有 CPU 回退。

音频堆栈要求使用 PipeWire. （话说桌面 Linux 用户也没人用古老的 PulseAudio 了吧）

大致复述一下 README 里介绍的使用方法：

```bash
git clone https://github.com/alirexha/woys.git
cd woys
./install.sh
```

真的就这么简单

~~又水一篇💦~~