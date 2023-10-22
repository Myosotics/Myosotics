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

首先引进定义和概念

`$\chi$`：所有可能的 examples 或者 instances 的集合，也被称作 input space。  
`$\mathcal{y}$`: 所有可能的 labels 或者 target values 的集合。此处方便计，讨论二分类问题，即
`$$\mathcal{y}=\{0,1\}$$`。
concept `$c: \chi \rightarrow \mathcal{y}$`，是从`$\chi$`到`$\mathcal{y}$`的映射。考虑到所有映射结果为1的相应的定义域，即`$\chi$`的子集，可以唯一确定一个 concept, 故我们有时也可以用`$\chi$`的子集来表示 concept。


