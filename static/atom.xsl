<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:atom="http://www.w3.org/2005/Atom">
  <xsl:output method="html" indent="yes" />

  <xsl:template match="/">
    <xsl:variable name="accent">
      <xsl:choose>
        <xsl:when test="/atom:feed/atom:accent"><xsl:value-of select="/atom:feed/atom:accent" /></xsl:when>
        <xsl:otherwise>139, 92, 246</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="accentLight">
      <xsl:choose>
        <xsl:when test="/atom:feed/atom:accentLight"><xsl:value-of select="/atom:feed/atom:accentLight" /></xsl:when>
        <xsl:otherwise>167, 139, 250</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="debounce">
      <xsl:choose>
        <xsl:when test="/atom:feed/atom:debounce"><xsl:value-of select="/atom:feed/atom:debounce" /></xsl:when>
        <xsl:otherwise>70</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <html lang="{/atom:feed/atom:language}">
      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title><xsl:value-of select="/atom:feed/atom:title" /></title>
        <link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png" />
        <link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png" />
        <link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png" />
        <style>
          :root {
            --bg: rgb(39, 39, 42);
            --card: rgb(24, 24, 27);
            --border: rgb(63, 63, 70);
            --text: rgb(250, 250, 250);
            --muted: rgb(161, 161, 170);
            --primary: rgb(<xsl:value-of select="$accent" />);
            --primary-light: rgb(<xsl:value-of select="$accentLight" />);
          }
          * { box-sizing: border-box; }
          body {
            margin: 0;
            background-color: var(--bg);
            background-image:
              linear-gradient(to bottom, rgba(39, 39, 42, 0.62), rgba(39, 39, 42, 0.95)),
              url('<xsl:value-of select="/atom:feed/atom:background"/>');
            background-attachment: fixed, fixed;
            background-size: cover, cover;
            background-position: center top, center top;
            background-repeat: no-repeat, no-repeat;
            color: var(--text);
            font-family: ui-sans-serif, system-ui, -apple-system, "Segoe UI", Roboto,
              "Noto Sans SC", "PingFang SC", "Hiragino Sans GB", "Microsoft YaHei", sans-serif;
            line-height: 1.7;
            font-size: 16px;
          }
          .container { max-width: 46rem; margin: 0 auto; padding: 2.5rem 1.25rem 4rem; }
          header h1 { margin: 0 0 0.3rem; font-size: 1.875rem; font-weight: 800; letter-spacing: -0.02em; }
          header h1 a { color: var(--text); text-decoration: none; }
          header h1 a:hover { color: var(--primary-light); }
          .subtitle { color: var(--muted); margin: 0; font-size: 0.95rem; }
          .notice {
            background: rgba(<xsl:value-of select="$accent" />, 0.09);
            border: 1px solid rgba(<xsl:value-of select="$accent" />, 0.32);
            border-left: 3px solid var(--primary);
            border-radius: 0.5rem;
            padding: 0.8rem 1rem;
            margin: 1.75rem 0 2rem;
            font-size: 0.9rem;
          }
          .notice strong { color: var(--primary-light); }
          .notice p { margin: 0.3rem 0 0.55rem; color: var(--muted); }
          #feed-url {
            display: block;
            background: rgba(0, 0, 0, 0.3);
            color: var(--text);
            border-radius: 0.35rem;
            padding: 0.4rem 0.6rem;
            font-size: 0.82rem;
            overflow-x: auto;
            white-space: nowrap;
          }
          .entry {
            border: 1px solid var(--border);
            border-radius: 0.75rem;
            background: var(--card);
            padding: 1.15rem 1.4rem;
            margin-bottom: 0.9rem;
            transition: border-color 0.15s ease, transform 0.15s ease;
          }
          .entry.is-hovered, .entry:focus-within {
            border-color: var(--primary);
            transform: translateY(-1px);
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.35);
          }
          .entry-title { margin: 0 0 0.4rem; font-size: 1.2rem; font-weight: 700; }
          .entry-title a { color: var(--text); text-decoration: none; }
          .entry-title a:hover { color: var(--primary-light); }
          .entry-meta { color: var(--muted); font-size: 0.82rem; margin-bottom: 0.55rem; }
          .entry-meta .sep { margin: 0 0.35rem; opacity: 0.6; }
          .tag {
            display: inline-block;
            background: rgba(<xsl:value-of select="$accent" />, 0.14);
            color: var(--primary-light);
            border-radius: 0.3rem;
            padding: 0.05rem 0.4rem;
            margin-right: 0.25rem;
            font-size: 0.78rem;
          }
          time { font-variant-numeric: tabular-nums; }
          .entry-summary { color: rgb(212, 212, 216); margin: 0 0 0.7rem; font-size: 0.95rem; }
          .entry-link {
            color: var(--primary-light);
            font-size: 0.88rem;
            font-weight: 600;
            text-decoration: none;
            border-bottom: 1px solid transparent;
          }
          .entry-link:hover { color: var(--primary); border-bottom-color: currentColor; }
          footer { margin-top: 2.5rem; color: var(--muted); font-size: 0.8rem; text-align: center; }
        </style>
      </head>
      <body>
        <div class="container">
          <header>
            <h1>
              <a href="{/atom:feed/atom:link[@rel='alternate']/@href}">
                <xsl:value-of select="/atom:feed/atom:title" />
              </a>
            </h1>
            <p class="subtitle"><xsl:value-of select="/atom:feed/atom:subtitle" /></p>
          </header>

          <div class="notice">
            <strong>这是一个 Atom 订阅源</strong>
            <p>将本地址复制到 RSS 阅读器即可订阅。</p>
            <code id="feed-url"></code>
          </div>

          <main>
            <xsl:apply-templates select="/atom:feed/atom:entry" />
          </main>

          <footer>
            <xsl:value-of select="/atom:feed/atom:rights" />
            <br />
            由 <xsl:value-of select="/atom:feed/atom:generator" /> 生成
          </footer>
        </div>

        <script>
          document.addEventListener('DOMContentLoaded', function () {
            var feedUrl = document.getElementById('feed-url');
            if (feedUrl) feedUrl.textContent = location.href;
            document.querySelectorAll('time').forEach(function (t) {
              var d = new Date(t.getAttribute('datetime'));
              if (!isNaN(d.getTime())) {
                t.textContent = d.toLocaleDateString();
                t.title = d.toLocaleString();
              }
            });

            // 高亮防抖：快速划过时不闪烁，仅当鼠标停留指定毫秒后才点亮
            var hoverTimer = null;
            var hovered = null;
            function setHover(entry) {
              if (hovered === entry) return;
              if (hovered) hovered.classList.remove('is-hovered');
              if (entry) entry.classList.add('is-hovered');
              hovered = entry;
            }
            document.addEventListener('mousemove', function (e) {
              var entry = e.target.closest('.entry');
              clearTimeout(hoverTimer);
              if (entry !== hovered) {
                if (hovered) setHover(null);
              }
              hoverTimer = setTimeout(function () { setHover(entry); }, <xsl:value-of select="$debounce" />);
            });
            document.addEventListener('mouseleave', function () {
              clearTimeout(hoverTimer);
              setHover(null);
            });
          });
        </script>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="atom:entry">
    <article class="entry">
      <h2 class="entry-title">
        <a href="{atom:link[@rel='alternate']/@href}">
          <xsl:value-of select="atom:title" />
        </a>
      </h2>
      <div class="entry-meta">
        发布于 <time datetime="{atom:published}"><xsl:value-of select="atom:published" /></time>
        <xsl:if test="atom:updated and atom:updated != atom:published">
          <span class="sep">·</span>
          更新于 <time datetime="{atom:updated}"><xsl:value-of select="atom:updated" /></time>
        </xsl:if>
        <xsl:if test="atom:category">
          <span class="sep">·</span>
          <xsl:for-each select="atom:category">
            <span class="tag"><xsl:value-of select="@term" /></span>
          </xsl:for-each>
        </xsl:if>
      </div>
      <xsl:if test="atom:summary">
        <p class="entry-summary"><xsl:value-of select="atom:summary" /></p>
      </xsl:if>
      <a class="entry-link" href="{atom:link[@rel='alternate']/@href}">阅读全文 →</a>
    </article>
  </xsl:template>

</xsl:stylesheet>
