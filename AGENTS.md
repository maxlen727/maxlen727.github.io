# AGENTS.md

Hugo + Blowfish 主题魔改，目标是「终于阅读、不花哨、可维护」。

## 分支与部署

- **不要动 main，不要部署到线上。** 所有改动在实验分支验收。
- 主仓库工作分支：`experiment/blowfish-mod`（远端 `git@github.com:maxlen727/maxlen727.github.io.git`）
- submodule 工作分支：`experiment/article-width`
- 主分支合并与部署由用户在 Vercel 上确认，AI 只推实验分支。

## 仓库结构

```
myblog/                        主仓库
├── config/_default/
│   ├── hugo.toml              [services.rss] limit = 15
│   └── params.toml            [article] 宽度、[atom]、colorScheme
├── content/posts/             文章原文
├── data/
│   ├── friends.toml           友链数据（与布局分离）
│   └── hitokoto.toml          首页一言句库
├── layouts/                   项目层覆盖（优先级高于主题，能用覆盖就别改 submodule）
│   ├── _default/atom.xml      Atom 输出格式
│   ├── links.html             友链卡片页
│   └── partials/
│       ├── comments.html      Twikoo + 主题色覆盖
│       ├── extend-head.html   字体、正文竖图限高等全局 <style>
│       ├── extend-footer.html 一言脚本（已移除 CDN pangu.js）
│       ├── pangu-content.html 构建时盘古化
│       └── search.html        搜索框主题色修复
├── static/atom.xsl            Atom 页 XSLT 客户端转换
└── themes/blowfish/           submodule，直接改（见下方工作流）
```

submodule 是 fork 到 `maxlen727/blowfish` 的副本，**直接在 submodule 里改**（用户选的方案，不用项目覆盖式）。

## submodule 工作流（重要）

- `.gitmodules` 用 **HTTPS** 地址（`https://github.com/maxlen727/blowfish.git`），Vercel CI 才能拉取。
- submodule 内部 `origin` 用 **SSH**（本地推送用）；`upstream` 保留官方仓库用于同步上游。
- **不要跑 `git submodule sync`**，它会用 .gitmodules 的 HTTPS 覆盖内部 SSH 远端。
- **推送 submodule 前必须先 `git fetch origin main`**，否则本地缺新版对象，`git pack-objects` 会打包整个历史卡住。
- 主仓库提交时要 `git add themes/blowfish` 一并更新 submodule 指针。

## 魔改清单与配置项

| 功能 | 配置/文件 | 说明 |
|---|---|---|
| 正文宽度（无 TOC） | `params.toml` `[article].maxContentWidth` = `80ch` | 主题默认 65ch，高分辨率屏向右拓展 |
| 正文宽度（带 TOC） | `params.toml` `[article].maxContentWidthWithToc` = `75ch` | 同步缩小正文与 TOC 间距（`pl-8`→`pl-4`），TOC 位置不动 |
| Atom 条目数 | `hugo.toml` `[services.rss] limit` = `15` | |
| Atom 页美化 | `layouts/_default/atom.xml` + `static/atom.xsl` | XSLT 客户端转换；模板剥离 github/gitea shortcode 输出的 `<script>`（阅读器不执行脚本，相对路径 `/js/` 会 404 并留下空壳卡片） |
| Twikoo 主题色 | `layouts/partials/comments.html` | 覆盖 Element 默认蓝 #409eff，引用 `--color-primary-*` |
| 友链 | `data/friends.toml` + `layouts/links.html` | 数据与布局分离；卡片继承主题 bg，靠 border/shadow 分层 |
| 字体 | `extend-head.html` | HarmonyOS Sans SC（jsdelivr，cn-font-split 分包按需加载）；字距 0.03em，正文 1.05rem，代码块排除字距 |
| 一言 | `data/hitokoto.toml` + `extend-footer.html` | 随机替换 `h1.font-extrabold + h2`，HTML 保留 headline 兜底 |
| 盘古化 | `pangu-content.html` | **构建时**实现（摘出 HTML 标签→纯文本加空格→还原标签），替代 CDN pangu.js，零闪烁 |
| 搜索框 | `layouts/partials/search.html` | 修复 Tailwind v4 Preflight 的蓝色聚焦环，改跟随主题 primary |
| 竖图限高 | `extend-head.html` `.article-content img` `max-height: 65vh` | 见下方图片排版 |

**强调色不写死**：自动从主题 `colorScheme`（congo 配色）推导 `--color-primary-400/500`，新功能一律引用该变量。

## Hugo 相关的坑

- Hugo **0.166 不支持 text 级 render hook**（只有 blockquote/codeblock/heading/image/link/passthrough/table），`render-text.html` 实测不执行。盘古化因此改在模板层对 `.Content` 处理。
- `replaceRE` 返回**普通字符串**，对 `.Content` 处理后**必须 `| safeHTML`**，否则 HTML 标签被转义成 `&lt;div` 可见文本。
- `printf "%s"` 与 `replaceRE` 的 `$1`/`${1}` 混用会冲突，正则里直接写字符串常量。
- `hugo server` **不会热加载启动后才新增的 data 文件**（曾导致一言「空页面」误判）；新增 data 后 `pkill hugo` 重启 server。

## 前端 / Tailwind 的坑

- **Tailwind v4 Preflight** 给所有 `[type=search]` 等输入框强加蓝色边框与聚焦环（`oklch(...262.881)` 色相即蓝），主题只写了 `appearance-none` 没覆盖。修复见 `search.html`，且聚焦环要做成框内 inset 描边，别外扩。
- **JS 动态拼接的类名不会被 Tailwind 按需编译**（扫描器只看模板不看 JS）。`search.js` 用到的 `bg-neutral-700`/`bg-primary-900` 需在模板 `<style>` 里显式声明，否则暗色模式结果项背景失效。
- 深色模式高亮别用 `primary-900`（太深看不出），提到 `primary-800`。

## 图片排版经验

- **竖图（宽高比 < 1）不能撑满正文宽度**，否则高度按比例爆炸占近两屏；横图随便。
- 限高用 `max-height: Nvh` + `width: auto` + `margin-inline: auto` 居中，浏览器自动等比缩放，横图不受影响。
- 成组的图优先并排（grid）而非纵向堆叠。

## 验收与部署流程

1. 本地 `hugo server` 验收（改动后视情况重启 server）。
2. 用户本地确认后再上传：**先提交 submodule（fetch → push），再提交主仓库**。
3. 推送后提醒用户在 Vercel 预览验收。
4. 网络走代理（fake-ip 198.18.x），SSH 大数据传输可能间歇 stall，**重试通常可成**。浏览器工具若未连接，用 `curl` + python 验证渲染结果。
