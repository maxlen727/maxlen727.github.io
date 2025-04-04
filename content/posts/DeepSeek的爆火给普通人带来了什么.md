---
title: DeepSeek的爆火给普通人带来了什么 ft. 某不科学的AI杂谈
summary: 写在2025年初，也就是DeepSeek R1火爆的时候。此时我也比较闲，所以有了一堆废话想要絮叨絮叨，就写出来了。然而可惜我并无专业知识，也无“敏锐的行业视角”，一切都是无聊又不科学的杂谈。
date: 2025-02-09T16:10:33+08:00
lastmod: 2025-02-09T16:10:33+08:00
slug: 2025-deepseek-ai
tags:
  - AI
draft: false
---
## 初闻DeepSeek

我第一次知道DeepSeek是在林亦LYi做的[林哥的大模型野榜](https://lyihub.com/)看到了深度求索DeepSeek，就去了解了一下。也就是2024年7月份的时候我就知道了深度求索这家公司。这完全是出于我的好奇心，当时把榜上的所有大模型都了解了一下。而当时DeepSeek的表现不算亮眼，我记住的只是GLM、通义千问这样的国内强手，对于其它在榜上表现差一些的模型比如海螺AI，跃问星辰之类的我认为这些厂商迟早会消失的，只是当下的泡沫罢了。当时的DeepSeek被我归类到”泡沫“一类中，它的名字我倒是印象深刻——深度求索，很浪漫的公司名字。

第二次听说DeepSeek就是它的低价成为了圈内的一条新闻：大概是说缓存命中之类的，有朋友表示这是拉开了AI价格战的序幕。“这个价格真的非常诱人，便宜到像诈骗”。现在回看那也是2024年8月的事了，我不清楚到底多少人因为这个认真研究他家模型了，或者因为这个模型太名不见经传而只是把这件事仅仅当是一个新闻略过了。

第三次听说DeepSeek就是听说雷军从深度求索挖走一个“天才AI少女”什么的，当时是DeepSeek v2.5的时候吧，貌似这位姐姐每天都很开心地在知乎上发布一些技术细节。每当我看见某个人对于技术（或者别的吧）的热爱时我就会感到激情澎湃，追求自己的热爱，这真的很美好。

然后就是v3的爆火了，主要原因是模型能力号称追平GPT4o和它极低的价格。

![DeepSeek v3 Benchmark](https://dp-cdn-deepseek.obs.cn-east-3.myhuaweicloud.com/api-docs/ds_v3_benchmark_hist_zh.jpeg)

如果仅仅是说追平GPT4o估计不足为奇，因为国内厂商做的LLM只要面对竞赛训练一下：“自己的Benchmark中我就是无敌的！”这样，人人都可以喊打平OpenAI了。

我想关键的是价格低这个因素的加成，另外还有开源光环的加成。

![DeepSeek v3 API价格](https://dp-cdn-deepseek.obs.cn-east-3.myhuaweicloud.com/api-docs/ds_v3_price_2_zh.jpeg)

面对v3的小火，我是充满批判地看的。因为在我关注的国内模型中，我只知道Qwen团队是在认真做模型的。而这个莫名其妙冒头的DeepSeek真的很奇怪。当时发了一条tg吐槽这件事：

> 最近DeepSeek风声是真大，我就比较好奇啊，到底是真本事还是舆论衬得它厉害了。
> 另外发现[林亦做的这个大模型野榜](https://lyihub.com/)竟然把DeepSeek给撤下去了，不知是什么原因。。。上星期看的时候还有DeepSeek的说，并且当时看榜的时候确实是DeepSeek屠榜，然而是v2.5模型屠的榜，而不是靠最近很火的“超越GPT4o”的MoE模型v3拿的榜首。当然了，我只是提到这一有趣的现象，这榜确实是野榜，并不能准确说明什么问题。
> 另外就是榜上的模型能力和我体感感受差距还是比较大的。理论上GLM、Gemini、Qwen很强，但我觉得这几个并不好用，目前还是GPT用的比较多。
> 当然如果有时间尝试一下别的模型也是好的。

DeepSeek R1是真正让它出圈的。甚至冯骐说“这是一个国运级的创新”。R1本来是LLM研究成果，结果是上升到了国家政治层次（to be honest 我真的很讨厌把所有事情都扯到政治上）。

R1真正让我兴奋的是CoT，并且DeepSeek团队选择将她的CoT完全展示出来，很明显可以看出这位调皮的模型会不断验证自己的思路、反思自己的做法。惊艳了第一次尝试CoT模型的我。我在它还没有非常出圈的时候进行了大概百轮对话，体验非常好，DeepSeek也取代了我浏览器上ChatGPT的常驻标签页位。~~强调没出圈的时候体验好是因为出圈后就一直服务器繁忙了！~~

---
## DeepSeek冲击波

DeepSeek的训练成本优势、开源路线都极大冲击了LLM这个领域。

- 英伟达股票大跌
- Sam Altman承认OpenAI 的闭源策略站在了历史的错误一边
- OpenAI推出o3系列应对DeepSeek R1
- Anthropic直接急眼，喷了DeepSeek一通之后赶紧推出Sonnet 3.7
- xAI也是赶紧推出Grok3，跟进Think功能
- Meta是最慌的，担心自己在开源LLM的话语权被稀释。立了好几个小组试图加快LLaMA的开发，并延迟LLaMA 4发布时间
- 百度文心一言宣布接入DeepSeek，并即将在本年6月份开源文心一言4.5
- 阿里Qwen团队继续打磨QwQ（我估计他们也在加急训练更大尺寸的QwQ了）
- 月之暗面kimi发布k1.8长思考，并发布论文与DeepSeek技术对垒。当然，最好的消息是他们终于不准备烧钱营销了
- 豆包、ChatGLM等等上线深度思考功能
- MiniMax开源MiniMax-01模型

最显著的影响就是大家赶紧跟了推理模型，并开始用RL训练模型。还有一些厂商也放弃了闭源路线，转而开源来加速生态的繁荣，这是很好的。另外影响了一些团队开始潜心技术做模型，更加注重基础框架的研究。还有不少API价格都由于DeepSeek的影响而降价。

---
## DeepSeek落地风暴

后来很有趣的现象就是当大家都把DeepSeek奉为珍宝的时候，这场AI风暴狂野地开始席卷了各行各业。

- 武汉云通过集成DeepSeek构建AIGC平台，实现企业政策匹配自动化。
- 某三甲医院基于DeepSeek开发智能诊疗助手，通过MaxKB平台接入超过50万份临床指南和病例数据。医生输入患者主诉后，系统可在3秒内生成包含鉴别诊断、检查建议和用药参考的结构化报告，且所有建议均标注依据来源（如《中国高血压防治指南2024版》第X章）。
- 华为小艺、小米小爱等接入DeepSeek
- 文心一言、腾讯元宝等接入DeepSeek
- 纳米AI关闭其它大模型调用接口，仅保留DeepSeek
- 小猿搜题、微信、WPS、MasterGo等接入DeepSeek

首先政府能开始积极采用AI用政这实在是让我惊讶。我印象中的我们的政府应该是比较保守稳重的，我不太认为它们能接受新事物。然而这次的DeepSeek服务公务让我对政府大大改观。从官方给出的各种数据来说，DeepSeek节省了很多人力成本，并且让整个系统的运作错误更少更加高效了。DeepSeek R1的能力出众我想确实是原因之一了，其次是R1并不依赖英伟达CUDA，它可以被移植在国产的华为昇腾等国产芯片上，这也许也是一个重要原因。

然后是各个APP都争先接入了DeepSeek，大家都开始卷AI了，当然有跟热度的成分在里面，但是实用价值确实更多的。这在“GPT时刻”时都未见到，现在的DeepSeek却是让AI飞入寻常百姓家了。我真正感到：AI时代终于在中国来了。

有趣的是纳米AI本来就是一个AI模型聚合类网站，然而在DeepSeek R1来到之后，它直接把其它模型的调用接口全都关了，只保留了R1，足见其能力强悍。

---
## DeepSeek出圈带来的改变就发生在我身边

开学之后老师同学都在聊DeepSeek，不关心技术的大众都知道了它那就很能说明问题了。

我们学校是非常死板的严重受体制影响的学校，但是我没想到的是校长竟然宣言“要让同学们都用上DeepSeek”，并且破天荒地允许了测试班级带手机。这在我看来是非常离谱的。

更离谱的是后来还请来了所谓的“专家”进行“DeepSeek助力教育”的讲座。学校不是开玩笑的，他们真的认真想让DeepSeek介入教学了。

语文老师PPT里开始用DeepSeek做课文升华总结；英语老师开始用DeepSeek帮她批改作文；跟科技二字完全不沾边的数学老师用DeepSeek写了一个随机点名的网页......

---
## 我们正在加速奔向未来

当DeepSeek在国产芯片上自主生长，当每个学生的草稿本都跃动着思维的星火，我仿佛看见这样的未来：晨光中，医生的诊疗建议与三百万篇论文共振；深夜里，工程师的灵感在量子比特间开花。那些曾困在论文里的公式、锁在数据库里的知识，正在变成普通人指尖跃动的光——这或许就是技术革命最浪漫的模样：它让每个平凡人都能触摸星辰。

---
## 尾巴

🤣👉🤡

![李彦宏：开源模型会越来越落后](https://maxlen727.github.io/picx-images-hosting/图片.7pgfh6i7n.webp)

---
本文由Qwen2.5-Max with QwQ协助完成
