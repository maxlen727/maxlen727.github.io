---
title: 用PipeWire和OBS实现Linux下虚拟麦克风
summary: 在视频录制或直播时，OBS不仅能作为虚拟摄像头，还能通过一些设置将音频输出转换成虚拟麦克风
date: 2025-03-22T06:30:43+08:00
lastmod: 2025-03-22T06:30:43+08:00
slug: pipewire-obs-virtual-mic
tags:
  - Linux
  - Wayland
  - OBS
  - 小记
draft: false
---
在视频录制或直播时，OBS不仅能作为虚拟摄像头，还能通过一些设置将音频输出转换成虚拟麦克风。

---
## 1. 创建虚拟音频设备

KDE 6下可以利用 PipeWire 来创建虚拟设备。首先，需要建立两个虚拟设备：

- **Virtual-Sink**：作为 OBS 的虚拟音频输出设备。
- **Virtual-Mic**：作为虚拟麦克风输入设备，将 Virtual-Sink 的监控音频传输到其他应用程序。

打开终端，输入以下命令：

```bash
pactl load-module module-null-sink media.class=Audio/Sink sink_name=Virtual-Sink
pactl load-module module-null-sink media.class=Audio/Source/Virtual sink_name=Virtual-Mic
```

这两条命令会分别创建名为 `Virtual-Sink` 和 `Virtual-Mic` 的虚拟音频设备。(>ω<)

---
## 2. 连接音频通道

下一步是将 OBS 的音频输出连接到 Virtual-Sink，再将 Virtual-Sink 的监控输出链接到 Virtual-Mic。具体操作如下：

1. 使用 `pw-link` 命令列出所有音频输出设备，找到 OBS 的音频输出设备（通常名称中会包含 `obs`）：

```bash
pw-link -o
```

2. 将 OBS 的左右声道分别连接到 Virtual-Sink：

```bash
pw-link OBS-Monitor:output_FL Virtual-Sink:playback_FL
pw-link OBS-Monitor:output_FR Virtual-Sink:playback_FR
```

3. 再将 Virtual-Sink 的监控输出连接到 Virtual-Mic 的左右声道：

```bash
pw-link Virtual-Sink:monitor_FL Virtual-Mic:input_FL
pw-link Virtual-Sink:monitor_FR Virtual-Mic:input_FR
```

这样一来，OBS 输出的音频就会经过 Virtual-Sink，再由 Virtual-Mic 将音频传递给其他应用程序。(๑•̀ㅂ•́)و✧

---
## 3. OBS 内部设置

为了让 OBS 的音频正确传输，咱们还需要在 OBS 内部进行相应设置：

- **设置音频输出设备**： 
	在 OBS 菜单中，依次点击“文件” > “设置” > “音频”，将“高级”中的“监听设备”设置为刚刚创建的 `Virtual-Sink`。
- **启用音频监听**： 
	在 OBS 主界面，点击音频混音器中齿轮图标。将需要传输的音频源的“音频监听”设置为“监听和输出”，这样 OBS 会同时输出和监听该音频。


---
以上就是 Linux 下通过 PipeWire 配置 OBS 虚拟麦克风的全部步骤，希望能帮助各位轻松实现音频传输，享受更好的直播或录制体验！(≧◡≦)喵～