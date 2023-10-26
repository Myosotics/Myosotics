---
title: The PAC learning Framework
author: Myosotics
date: '2023-10-21'
slug: []
categories:
  - Note
tags:
  - Literature
  - Machine Learnging
---

注意：此处主要参考书籍[Foundations of Machine Learning](https://cs.nyu.edu/~mohri/mlbook/) 

PAC, 即 Probably Approximately Correct 的缩写。PAC框架根据实现近似解所需的样本点
数量、样本复杂度以及学习算法的时间和空间复杂度来帮助定义可学习概念的类别，这取决
于 concept 的计算表示的成本。

# The PAC learning model

1. 基本符号：  
`$\mathcal{X}$`：所有可能的 examples 或者 instances 的集合，也被称作 input space。  
`$\mathcal{y}$`: 所有可能的 labels 或者 target values 的集合。此处方便计，讨论二
分类问题，即
`$$\mathcal{y}=\{0,1\}.$$`  
concept `$c: \mathcal{X} \rightarrow \mathcal{y}$`，是从`$\mathcal{X}$`到`$\mathcal{y}$`的映射。考虑到所有映射结果为1的相应
的定义域，即`$\mathcal{X}$`的子集，可以唯一确定一个 concept, 故我们有时也可以用`$\mathcal{X}$`
的子集来表示 concept。  
concept class: 我们希望学习的 concept 的集合，记作`$\mathcal{C}$`。可以理解为所有
concept 的集合。

2. 训练任务的抽象描述：  
假设样本独立同分布来自于固定但未知的分布`$\mathcal{D}$`。机器学习问题陈述如下，考虑一些
concepts 的集合`$\mathcal{H}$`, 即 hypothesis set, 这些集合可能与`$\mathcal{C}$`
不一致。给定一组来自分布`$\mathcal{D}$`的独立同分布样本`$S=(x_1,\cdots, x_m)$`，
其标签相应为`$(c(x_1), \cdots, c(x_m))$`，其中`$c\in\mathcal{C}$`为一个我们要去
学习的 concept。任务便是使用带有标签的样本`$S$`，从`$\mathcal{H}$`选取
generalization error 最小的 concept。

3. Generalization error:  
一个 hypothesis `$h\in\mathcal{H}$` 的 generalization error 也被称作hypothesis `$h\in\mathcal{H}$`的 risk 或者 true error(error), 记作`$R(h)$`。  
<big>**定义2.1**</big>(Generalization error) 给定一个 hypothesis `$h\in\mathcal{H}$`，目标 concept
为`$c\in\mathcal{C}$`和一组样本`$S=(x_1,\cdots, x_m)$`，分布`$\mathcal{D}$`，有

$$
R(h) = \mathop{\mathbb{P}} \limits_{X\sim \mathcal{D}} [h(x)\ne c(x)] =\mathop{\mathbb{E}} \limits_{x\sim \mathcal{D}}[1_{h(x)\ne c(x)}],
$$

其中`$1_{\omega}$`是事件`$\omega$`的示性函数。

4. Empirical error:  
由于 Generalization error 不一定能得到，故常用 empirical error 代替。  
<big>**定义2.2**</big>(Empirical error)给定一个 hypothesis `$h \in \mathcal{H}$`，
一个目标 concept `$c\in \mathcal{C}$`和一组样本`$S=(x_1, \cdots, x_m)$`，则 h 的
empirical error 或者 empirical risk 定义如下
`$$\hat{R}_S = \frac{1}{m}\sum_{i=1}^{m}1_{h(x_i)\ne c(x_i)}.$$`
对于一个固定的`$h\in\mathcal{H}$`，当样本独立同分布时，有
$$
\mathop{\mathbb{E}}\limits_{S\sim \mathcal{D}^m}[\hat{R}_S(h)]=R(h).
$$

5. PAC-learning:  
假定表示任意元素`$x\in\mathcal{X}$`的计算代价不超过`$O(n)$`。让`$h_S$`表示算法
`$\mathcal{A}$`经过接受带标签样本`$S$`得到的 hypothesis。  
**定义2.3**
(PAC-learning)如果存在一个算法`$\mathcal{A}$`和一个多项式函数`$poly(\cdot,\cdot,\cdot,\cdot)$`，对任意的`$\epsilon >0$`和`$\delta >0$`，对`$\mathcal{X}$`的所有分布`$\mathcal{D}$`
及任意的 target concept `$c \in \mathcal{C}$`，当样本大小
`$m\geqslant poly(1/\epsilon, 1/\delta, n, size(c))$`，都有
$$
\mathop{\mathbb{P}}\limits_{S\sim \mathcal{D}^m}[R(h_S)\leqslant \epsilon]\geqslant 1- \delta,
$$
则称 concept class `$\mathcal{C}$` 被称作是 PAC-learnable。若算法`$\mathcal{A}$`进一步
在`$poly(1/\epsilon,1/\delta,n,size(c))$`内运行(时间复杂度)，则曾`$\mathcal{C}$`是 
efficiently PAC-learnable。当这样的算法`$\mathcal{A}$`存在时，该算法被称为一个`$\mathcal{C}$`
的 PAC-learnable 算法。

6. Generalization bound  
generalization bound：一个 generalization bound 表明，在概率至少为`$1−\delta$`的情况下，
`$R(h_S)$`的上界取决于样本量`$m$`和`$δ$`。

# Guarantees for finite hypothesis sets - consistent case

1. 在这节中，假定 hypothesis `$\mathcal{H}$` 的基数是有限的。并且我们考虑 consistent 
hypothesis，即在 training sample `$S$` 中没有 error，同时假定 target concept `$c$`
在`$\mathcal{H}$`中。

2. **定理2.5**(Learning bound - finite`$\mathcal{H}$`, consistent case)  
让`$\mathcal{H}$`为一个有限的函数集合，其中函数从`$\mathcal{X}$`映射到`$\mathcal{y}$`。
算法`$\mathcal{A}$`对任意 target concept`$c\in\mathcal{H}$`和独立同分布的样本`$S$`，
返回一个 consistent hypothesis `$h_S$`：`$\hat{R}_S(h_S)=0$`，则当
`\begin{equation}
m \geqslant \frac1\epsilon(\log|\mathcal{H}|+\log \frac1\delta) \tag{1}
\end{equation}`
时，对于任意的`$\epsilon,\delta > 0$`，有下列不等式成立
$$
\mathop{\mathbb{P}}\limits_{S\sim\mathcal{D}^m}[R(h_S)\leqslant\epsilon]
\geqslant1-\delta.
$$
公式(1)表明了 sample complexity，同时指明了 generalization bound：对于
任意的`$\epsilon,\delta >0$`，至少以`$1-\delta$`的概率，有
$$
R(h_S)\leqslant \frac1m(\log|\mathcal{H}| + \log\frac1\delta).
$$






