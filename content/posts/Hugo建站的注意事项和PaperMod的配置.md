---
title: Hugo建站的注意事项和PaperMod的配置
date: 2024-02-18T07:51:50+08:00
lastmod: 2024-07-23T08:43:50+08:00
author:
  - MaxLen
tags:
  - 博客
  - 网站
summary: 最近也是换用了Hugo构建网站，中间遇到的问题和我对PaperMod的魔改在此记录一下
weight: 
slug: hugo-and-papermod
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
## Hugo建站，你需要注意什么

首先感谢[Sulv](https://www.sulvblog.cn/posts/blog/)。我基本是跟着Sulv的教程配置的。我只写了一些Sulv没有提到，但可能会给人造成困惑的点。如果要用hugo建站的话，不妨将这篇和Sulv的配合看。

### 安装hugo

hugo有两个版本：`hugo`和`hugo-extended`。对于这两个版本有什么差别，官方文档这么说：

> Hugo is available in two editions: standard and extended. With the extended edition you can:
> - Encode to the WebP format when [processing images](https://gohugo.io/content-management/image-processing/). You can decode WebP images with either edition.
> - [Transpile Sass to CSS](https://gohugo.io/hugo-pipes/transpile-sass-to-css/) using the embedded LibSass transpiler. The extended edition is not required to use the [Dart Sass](https://gohugo.io/hugo-pipes/transpile-sass-to-css/#dart-sass) transpiler.
> We recommend that you install the extended edition.

所以我们在安装hugo时就选择extended版本进行安装。**无论是linux、mac还是windows,都推荐使用包管理器进行安装**。

PS： 如果无法正常运行hugo,请检查golang环境

### 建立站点文件之后就先换个主题吧

hugo与hexo不大相同的一点就是配置文件这块。hexo的主题是有独立的配置文件，但hugo就一个配置文件可以全包揽了，并且不同主题的配置相差很大。所以可以先挑主题再去改配置文件。

如果主题要使用git子模块安装，建议使用https而不是ssh. 这会有利于后面在Vercel上的部署（如果你不准备使用Vercel那可以不管）

### 配置文件相关

hugo的配置文件默认应该是`hugo.toml`，可以直接改成`hugo.yaml`，对于习惯yaml的我来说，这样的话似乎会方便一些。

然后具体配置文件怎么写的话可以去看你选择的主题提供的模板

### 写文章

`hugo server`真的很好用呢，是实时渲染的，对网站做出的更改基本上都可以实时在浏览器中预览到（又是一个脱离hexo的理由喵

正常来说`hugo new 文章名称.md`就可以在`content`下新建文章了（模板可以去`archetypes/default.md`下配置

在新建文章时也可以使用相对目录`hugo new 分类/文章名称.md`。

### 要在vercel上部署吗

我需要提醒：一定设置好vercel的环境变量！

```
HUGO_VERSION = vX.XXX.X
```

否则的话，vercel输出的网页就会是不正常的状态（比如js和css失效了之类的）

另外如果你使用了ssh+git子模块的方式安装了主题，那么到了Vercel这里可能会遇到git子模块相关的困难。我的建议是将ssh方式安装的子模块卸载，使用https安装。

构建指令也许应该设置为：

```bash
git submodule update --init --recursive && hugo --gc --minify
```

---

那似乎就没有别的坑需要注意了。转入下一部分吧～

---

## PaperMod配置

[PaperMod](https://github.com/adityatelange/hugo-PaperMod)是我在使用的主题，因为我是比较喜欢素雅的风格了。我（依据Sulv的blog）对PaperMod进行了一些必要的魔改，展示一下吧。

> 为什么明明照着Sulv的教程改的，这里还要再写一遍呢？
> 因为发现Sulv的部分内容似乎已经不适合新版的hugo了，在我配置期间也造成了一些困扰。暂且都先记下来吧。

### 时间轴中文化

这个Sulv老师的方法没有问题。定位到`layouts/_default/archives.html`修改配置

```html
{{- define "main" }}

<header class="page-header">
  <h1>{{ .Title }}</h1>
  {{- if .Description }}
  <div class="post-description">
    {{ .Description }}
  </div>
  {{- end }}
</header>

{{- $pages := where site.RegularPages "Type" "in" site.Params.mainSections }}

{{- if .Site.Params.ShowAllPagesInArchive }}
{{- $pages = site.RegularPages }}
{{- end }}

{{- range $pages.GroupByPublishDate "2006" }}
{{- if ne .Key "0001" }}
<div class="archive-year">
  <h2 class="archive-year-header">
    {{- replace .Key "0001" "" }}年<sup class="archive-count">&nbsp;&nbsp;{{ len .Pages }}</sup>
  </h2>
  {{- range .Pages.GroupByDate "January" }}
  <div class="archive-month">
    <h3 class="archive-month-header">
      {{- if eq .Key "December" }}
      {{ "12月" }}
      {{- end }}
      {{- if eq .Key "November" }}
      {{ "11月" }}
      {{- end }}
      {{- if eq .Key "October" }}
      {{ "10月" }}
      {{- end }}
      {{- if eq .Key "September" }}
      {{ "9月" }}
      {{- end }}
      {{- if eq .Key "August" }}
      {{ "8月" }}
      {{- end }}
      {{- if eq .Key "July" }}
      {{ "7月" }}
      {{- end }}
      {{- if eq .Key "June" }}
      {{ "6月" }}
      {{- end }}
      {{- if eq .Key "May" }}
      {{ "5月" }}
      {{- end }}
      {{- if eq .Key "April" }}
      {{ "4月" }}
      {{- end }}
      {{- if eq .Key "March" }}
      {{ "3月" }}
      {{- end }}
      {{- if eq .Key "February" }}
      {{ "2月" }}
      {{- end }}
      {{- if eq .Key "January" }}
      {{ "1月" }}
      {{- end }}
      <!-- {{- .Key }} -->
      <sup class="archive-count">&nbsp;&nbsp;{{ len .Pages }}
      </sup>
    </h3>
    <div class="archive-posts">
      {{- range .Pages }}
      {{- if eq .Kind "page" }}
      <div class="archive-entry">
        <h3 class="archive-entry-title">
          {{- .Title | markdownify }}
          {{- if .Draft }}<sup><span class="entry-isdraft">&nbsp;&nbsp;[draft]</span></sup>{{- end }}
        </h3>
        <div class="archive-meta">
          {{- partial "post_meta.html" . -}}
        </div>
        <a class="entry-link" aria-label="post link to {{ .Title | plainify }}" href="{{ .Permalink }}"></a>
      </div>
      {{- end }}
      {{- end }}
    </div>
  </div>
  {{- end }}
</div>
{{- end }}
{{- end }}

{{- end }}{{/* end main */}}
```

### 标签云、友链、评论、侧边栏目录

这些都可以去看Sulv的blog, 但我要提到的是：

Sulv提到的`assets/css/extended/blank.css`不知为何在我这里不会生效，索性直接对应为`themes/PaperMod/assets/css/extended/blank.css`去改主题文件了。

放一下现在我的`blank.css`吧

```css
body {
    background-color:rgb(255,254,248) ;
}

.dark {
    background-color:#1d1e20 ;
}

.friendurl {
    text-decoration: none !important;
    color: black;
    box-shadow: none !important;
}

.myfriend {
    width: 56px !important;
    height: 56px !important;
    border-radius: 50%!important;
    padding: 2px;
    margin-top: 20px !important;
    margin-left: 14px !important;
    background-color: #fff;
}

.frienddiv {
    overflow: auto;
    height: 100px;
    width: 49%;
    display: inline-block !important;
    border-radius: 5px;
    background: none;
    
    -webkit-transition: all ease-out 0.3s;
    -moz-transition: all ease-out 0.3s;
    -o-transition: all ease-out 0.3s;
    transition: all ease-out 0.3s;
}

.dark .frienddiv:hover {
    background: var(--code-bg);
}

.frienddiv:hover {
    background: var(--theme);
    transition: transform 1s;
    webkit-transform: scale(1.1);
    -moz-transform: scale(1.2);
    -ms-transform: scale(1.2);
    -o-transform: scale(1.2);
    transform: scale(1.1);
}

.frienddiv:hover .frienddivleft img { 
    transition: 0.9s !important;
    -webkit-transition: 0.9s !important;
    -moz-transition: 0.9s !important;
    -o-transition: 0.9s !important;
    -ms-transition: 0.9s !important;
    transform: rotate(360deg) !important;
    -webkit-transform: rotate(360deg) !important;
    -moz-transform: rotate(360deg) !important;
    -o-transform: rotate(360deg) !important;
    -ms-transform: rotate(360deg) !important;
}

.frienddivleft {
    width: 92px;
    float: left;
    margin-right: -5px;
}

.frienddivright {
    margin-top: 18px;
    margin-right: 18px;
}

.friendname {
    text-overflow: ellipsis;
    font-size: 100%;
    margin-bottom: 5px;
    color: var(--primary);
}

.friendinfo {
    text-overflow: ellipsis;
    font-size: 70%;
    color: var(--primary);
}

@media screen and (max-width: 600px) {
    .friendinfo {
        display: none;
    }
    .frienddivleft {
        width: 84px;
        margin: auto;
    }
    .frienddivright {
        height: 100%;
        margin: auto;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .friendname {
        font-size: 18px;
    }
}

.toc {
    padding: 14px;
    border: solid 1px lightgray;
    font-size: 12px;
}


@media (min-width: 1280px) {
    .toc {
        position: sticky;
        float: left;
        --toc-left: calc(100vw / 50);
        left: var(--toc-left); /* _minimum_ distance from left screen border */
        top: 100px;
        margin-left: -1000px; /* overruled by left */
    
        width: calc((100vw - var(--main-width) - 2 * var(--gap)) / 2 - 2 * var(--toc-left));
        padding: 14px;
        border: solid 1px lightgray;
        font-size: 12px;
    }
  
    .toc .inner {
        padding: 0;
    }
  
    .toc details summary {
        margin-inline-start: 0;
        margin-bottom: 10px;
    }

}

/*标签*/
.terms-tags {
    text-align: center;
}

.terms-tags a:hover {
    background: none;

    webkit-transform: scale(1.2);
    -moz-transform: scale(1.2);
    -ms-transform: scale(1.2);
    -o-transform: scale(1.2);
    transform: scale(1.3);
}

.terms-tags a {
    border-radius: 30px;
    background: none;
    transition: transform 0.5s;
}

.dark .terms-tags a {
    background: none;
}

.dark .terms-tags a:hover {
    background: none;

    webkit-transform: scale(1.2);
    -moz-transform: scale(1.2);
    -ms-transform: scale(1.2);
    -o-transform: scale(1.2);
    transform: scale(1.3);
}

.terms-tags li {
    margin: 5px;
}
```

另外我的侧边目录并不是使用Sulv的做法，我觉得那样的不怎么好看。我的HTML是这样改的（css部分的话也包括在上面提到的`blank.css`了）：

```html
<div class="toc">
    <details {{if (.Param "TocOpen") }} open{{ end }}>
      <summary accesskey="c" title="(Alt + C)">
        <div class="details">{{ .Title }}</div>
      </summary>
      <div class="inner">
{{- $headers := findRE "<h[1-6].*?>(.|\n])+?</h[1-6]>" .Content -}}
{{- $has_headers := ge (len $headers) 1 -}}
{{- if $has_headers -}}

{{- $largest := 6 -}}
{{- range $headers -}}
{{- $headerLevel := index (findRE "[1-6]" . 1) 0 -}}
{{- $headerLevel := len (seq $headerLevel) -}}
{{- if lt $headerLevel $largest -}}
{{- $largest = $headerLevel -}}
{{- end -}}
{{- end -}}

{{- $firstHeaderLevel := len (seq (index (findRE "[1-6]" (index $headers 0) 1) 0)) -}}

{{- $.Scratch.Set "bareul" slice -}}
<ul>
    {{- range seq (sub $firstHeaderLevel $largest) -}}
    <ul>
        {{- $.Scratch.Add "bareul" (sub (add $largest .) 1) -}}
        {{- end -}}
        {{- range $i, $header := $headers -}}
        {{- $headerLevel := index (findRE "[1-6]" . 1) 0 -}}
        {{- $headerLevel := len (seq $headerLevel) -}}

        {{/* get id="xyz" */}}
        {{- $id := index (findRE "(id=\"(.*?)\")" $header 9) 0 }}

        {{- /* strip id="" to leave xyz, no way to get regex capturing groups in hugo */ -}}
        {{- $cleanedID := replace (replace $id "id=\"" "") "\"" "" }}
        {{- $header := replaceRE "<h[1-6].*?>((.|\n])+?)</h[1-6]>" "$1" $header -}}

        {{- if ne $i 0 -}}
        {{- $prevHeaderLevel := index (findRE "[1-6]" (index $headers (sub $i 1)) 1) 0 -}}
        {{- $prevHeaderLevel := len (seq $prevHeaderLevel) -}}
        {{- if gt $headerLevel $prevHeaderLevel -}}
        {{- range seq $prevHeaderLevel (sub $headerLevel 1) -}}
        <ul>
            {{/* the first should not be recorded */}}
            {{- if ne $prevHeaderLevel . -}}
            {{- $.Scratch.Add "bareul" . -}}
            {{- end -}}
            {{- end -}}
            {{- else -}}
            </li>
            {{- if lt $headerLevel $prevHeaderLevel -}}
            {{- range seq (sub $prevHeaderLevel 1) -1 $headerLevel -}}
            {{- if in ($.Scratch.Get "bareul") . -}}
        </ul>
        {{/* manually do pop item */}}
        {{- $tmp := $.Scratch.Get "bareul" -}}
        {{- $.Scratch.Delete "bareul" -}}
        {{- $.Scratch.Set "bareul" slice}}
        {{- range seq (sub (len $tmp) 1) -}}
        {{- $.Scratch.Add "bareul" (index $tmp (sub . 1)) -}}
        {{- end -}}
        {{- else -}}
    </ul>
    </li>
    {{- end -}}
    {{- end -}}
    {{- end -}}
    {{- end -}}
    <li>
        <a href="#{{- $cleanedID  -}}" aria-label="{{- $header | plainify -}}">{{- $header | safeHTML -}}</a>
        {{- else -}}
    <li>
        <a href="#{{- $cleanedID -}}" aria-label="{{- $header | plainify -}}">{{- $header | safeHTML -}}</a>
        {{- end -}}
        {{- end -}}
        <!-- {{- $firstHeaderLevel := len (seq (index (findRE "[1-6]" (index $headers 0) 1) 0)) -}} -->
        {{- $firstHeaderLevel := $largest }}
        {{- $lastHeaderLevel := len (seq (index (findRE "[1-6]" (index $headers (sub (len $headers) 1)) 1) 0)) -}}
    </li>
    {{- range seq (sub $lastHeaderLevel $firstHeaderLevel) -}}
    {{- if in ($.Scratch.Get "bareul") (add . $firstHeaderLevel) -}}
</ul>
{{- else -}}
</ul>
</li>
{{- end -}}
{{- end -}}
</ul>
{{- end -}}
      </div>
    </details>
  </div>
```

### Fancybox 灯箱

`config.yaml`文件中

```yaml
params:
    fancybox: true
```

定位到`layouts/_default/_markup/render-image.html`

```html
{{if .Page.Site.Params.fancybox }}
<div class="post-img-view">
<a data-fancybox="gallery" href="{{ .Destination | safeURL }}">
<img src="{{ .Destination | safeURL }}" alt="{{ .Text }}" {{ with .Title}} title="{{ . }}"{{ end }} />
</a>
</div>
{{ end }}
```

定位到`layouts/partials/head.html`

```html
{{if .Page.Site.Params.fancybox }}
<script src="https://gcore.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
<link rel="stylesheet" href="https://gcore.jsdelivr.net/gh/fancyapps/fancybox@3.5.7/dist/jquery.fancybox.min.css" />
<script src="https://gcore.jsdelivr.net/gh/fancyapps/fancybox@3.5.7/dist/jquery.fancybox.min.js"></script>
{{ end }}
```

### busuanzi 统计

定位到`layouts/partials/extend_head.html`

```html
{{- /* Head custom content area start */ -}}
{{- /*     Insert any custom code (web-analytics, resources, etc.) - it will appear in the <head></head> section of every page. */ -}}
{{- /*     Can be overwritten by partial with the same name in the global layouts. */ -}}
<!-- busuanzi -->
{{- if site.Params.busuanzi.enable -}}
  <script async src="https://busuanzi.ibruce.info/busuanzi/2.3/busuanzi.pure.mini.js"></script>
{{- end -}}
```

定位到`layouts/partials/footer.html`，在被`<footer>`包裹的块中加入

```html
    <!-- busuanzi -->
    {{ if site.Params.busuanzi.enable -}}
    <div class="busuanzi-footer">
    <span id="busuanzi_container_site_pv">
        本站总访问量<span id="busuanzi_value_site_pv"></span>次
    </span>
    <span id="busuanzi_container_site_uv">
        本站访客数<span id="busuanzi_value_site_uv"></span>人次
    </span>
    </div>
    {{- end -}}
```

定位到`layouts/_default/single.html`，在`<div class="post-meta">`中加入

```html
<!-- busuanzi -->
{{ if site.Params.busuanzi.enable -}}
  &nbsp·&nbsp<span id="busuanzi_container_page_pv">本文阅读量<span id="busuanzi_value_page_pv"></span>次</span>
{{- end }}
```

然后`hugo.yaml`中修改

```yaml
params:  
    busuanzi:
        enable: true
```

---

## 好，就这样吧

对了，放上一些必要的版权声明：

> 版权声明：部分代码摘自「Sulv's Blog」，遵循CC 4.0 BY-SA版权协议
> 参考链接：https://www.sulvblog.cn/posts/blog/

