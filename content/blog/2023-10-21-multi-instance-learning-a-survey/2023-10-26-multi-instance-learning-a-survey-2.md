---
title: 'Multi-Instance Learning: A Survey(2)'
author: ''
date: '2023-10-26'
slug: []
runtime: shiny
categories:
  - Article
tags:
  - Computer Science
  - Machine Learning
  - Supervised Learning
---

上接[Multi-Instance Learning: A Survey(1)](/blog/2023-10-21-multi-instance-learning-a-survey/2023-10-21-multi-instance-learning-a-survey-1/)

## ID3-MI

ID3-MI 是一个 decision tree algorithm，遵循 divide-and-conquer 的方式。广义上，
decision tree 有两个部分，即如何选择分离 tree nodes 的 test 和如何利用 tree 做
预测。在这里，ID3-MI algorithm 做出预测的方式与标准的 decision tree 相同，故问 
题的关键在于前者，进一步转化为 multi-instance entropy 的定义。  
给定数据集`$D$`，其中有`$p$`个 positive bag 和`$n$`个 negative instance，则定
义`$D$`关于该分类的 entropy 为
`\begin{equation}
Info(D) = -\frac{p}{p+n}\log_2(\frac{p}{p+n})-\frac{n}{p+n}\log_2(\frac{n}{p+n})\tag{1}
\end{equation}`
假定 attribute `$A$`被选择作为 test，并将`$D$`分为`$\{D_1,\cdots,D_l\}$`，令`$\lvert D\rvert$`和`$\lvert D_i \rvert$`分别表示`$D$`和`$D_i$`中的 instance 的数目，则
information gain of A on D 计算如下： 
`\begin{equation}
  \begin{aligned}
    Gain(D,A) &=Info(D)-Info(D,A)\\
    &=Info(D)-\sum_{i=1}^l\frac{|D_i|}{|D|}Info(D_i)
  \end{aligned}\tag{2}
\end{equation}`
上式当目标是对 instance 进行分类时用来选择 decision tree 的合适的 test 是足够的。
但为了区分 bag，还需要进行调整。令`$\pi(D)$`和`$v(D)$`分别表示`$D$`中的
positive 和 negative的 bag 的数量，则公式 (1) 改写如下：
$$
`\begin{aligned}
Info_{multi}(D)&=-\frac{\pi(D)}{\pi(D)+v(D)}\log_2\left(\frac{\pi(D)}{\pi(D)+v(D)}\right)\\
&-\frac{v(D)}{\pi(D)+v(D)}\log_2\left(\frac{v(D)}{\pi(D)+v(D)}\right)
\end{aligned}`
$$
从而在 bag 的水平下， information gain of A on D，即公式(2)改写如下
$$
`\begin{aligned}
Gain_{multi}(D,A)&=Info_{multi}(D)-Info_{multi}(D,A)\\
&=Info_{multi}(D)-\sum_{i=1}^l\frac{\pi(D_i)+v(D_i)}{\pi(D)+v(D)}Info_{multi}(D_i).
\end{aligned}`
$$          
同时，直接运用该式会导致计算较复杂，故可以用一种轻微的 divide-and-conquer 方式
来调整，即当一个positive bag 中的 instance 被预测为 positive 时，将该包中其他
instance 移除掉，这样便可以得到一个相对简单的 tree。

## RIPPER-MI

RIPPER-MI 是一个 rule induction algorithm。RIPPER-MI 和 supervised learner,i.e. RIPPER,
唯一不同的地方在于 coverage 的定义不同。  
给定数据集`$D$`，rule R 的 coverage 定义如公式(3)所示。

`\begin{equation}
\{\} \tag{3}
\end{equation}`
