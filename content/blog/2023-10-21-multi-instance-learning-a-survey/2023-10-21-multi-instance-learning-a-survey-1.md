---
title: 'Multi-Instance Learning: A Survey(1)'
author: Myosotics
date: '2023-10-21'
slug: []
runtime: shiny
categories:
  - Article
tags:
  - Computer Science
  - Machine Learning
  - Supervised Learning
---

# 摘要

## 英文原文

In multi-instance learning, the training set comprises labeled bags that are 
composed of unlabeled instances, and the task is to predict the labels of unseen 
bags. This paper provides a survey on this topic. At first, it introduces the 
origin of multi-instance learning. Then, developments on the study of 
learnability, learningal gorithms, applications and extensions of multi-instance
learning are reviewed. In particular, this paper employs a unified view to look
into multi-instance learning algorithms. Some important issues to be addressed 
are also discussed

Keywords: Learning from Examples; Multi-Instance Learning; Supervised Learning

## 翻译

在多实例学习中，训练集包括由未经标签的 instances 组成的有标签 bags ，并且训练任务
是去预测未知 bags 的标签。这篇文章在这个课题进行了研究调查。首先，这篇文章介绍了
多实例学习的起源。然后，对多实例学习在可学习性、学习算法、应用和扩展等方面的研究进展
进行了综述。特别地，这篇文章使用一种统一的观点来研究多实例学习算法。一些需要被解
决的重要问题也被得到讨论。

# 文章信息

1. Author: Zhi-Hua Zhou  
2. Title: Multi-Instance Learning: A Survey

# 文章框架

第一个部分为 Introduction 部分。首先引出介绍了机器学习的三种基本类别：supervised 
learning, unsupervised learning, and reinforcement learning。然后，对 multi-instance 
learning 诸如起源，训练数据及其特性和训练任务进行介绍。接下来，将 multi-instance 
learning 和机器学习的三种基本类别进行比较，并指出传统算法并不适用于解决 multi-instance 
learning 背景的问题。进一步，说明该算法发展的重要性和研究的必要性，也即本文目的。

第二个部分为 Drug Activity Prediction 部分，即介绍了 multi-instance 算法的起源。

第三个部分为 Learnability 部分。介绍了 multi-instance 算法的科学习性。

第四个部分为 Learning Algorithm 部分。介绍了除第二个部分提及的 APR 算法以外的
multi-instance 的五种算法的主要思想，其中这五种算法分别是 Diverse Density, 
Citation-kNN,  ID3-MI, RIPPER-MI, and BP-MIP。

第六个部分为 Extension 部分。首先，介绍了 MIL 在实数输出结果预测的相关情况。然后，点出了前面第四部分中算法应用场景与最初始问题
应用场景的不同，进一步规范 MIL 的定义。接下来，又对 multi-instance 问题进行分类。
最后，指出 multi-instance 可以作为命题和关系表征的关键、桥梁。

第七个部分为 Discussion 部分。首先，此处介绍了 multi-instance learning 发展的最
大问题，即可用于实验的真实数据集太少。然后，本文提及当前对传统算法调整得到 mult-
instance learning 算法的发展成绩斐然，但仍需进一步提出问题易发展 MIL, 如怎么对未
标签 bags 中的 instance 进行数据标签。最后，对 MIL 进行一些讨论：MIL 在实数场景
中的应用、广义 MIL 的讨论，说明 MIL 的发展要同应用结合起来。

 # Drug Activity Prediction
 
 在20世纪90年代中期，Dietterich 等人对药物活性预测这一问题上的研究催生出了 MIL。
 
1. 问题提出
 
在这项研究中，药物活性研究归为对分子的低能形状的研究。同一分子有不同低能形状，
当存在可以与目标领域紧密结合的低能形状时，该分子便可以作为药物。 Dietterich 等当时在进行研究时，只知道哪些分子可以作为药物，但并不清楚具体分子的哪种形状可以满
 足目标。由此便提出了 MIL 的雏形：在这里，分子作为 bag，而分子形状作为 instance。

2. 数据获取

通过从同一位置射出的方向不同的162束射线，构造出分子的表面，所产生的162个参数以及
分子的其他参数便构成了分子的一种形状的特征向量，即得到了 instance 。

3. 算法提出

Dietterich 提出了三种 axis-parallel rectangle (APR) 算法以解决药物活性预测问题。  
首先是 GFS elim-count APR 算法。该算法首先定义一个包围所有 positive bags 的 APR, 
然后通过贪婪地逐步缩小 APR 直到得到只剩下 positive bags 的 APR。对于每个 negative 
bags 中的 instance, 该算法计算舍弃其所需要附带的舍弃所有 positive bags 的
instance 的数量，并每次选择舍弃最少的( negative bags 的) instance 进行剔除。  
然后是 GFS kde APR 算法，该算法与 GFS elim-count APR 算法不同的地方在于，进行剔除
步骤时，该算法还多考虑了不同 positive bags 中被 APR 覆盖的instances 的数量：通过
使用损失函数控制剔除过程以使得每个 positive bags 中至少有一个 instance 得到保留在
APR 中。  
最后是 iterated-discrim APR 算法。该算法首先使用 greedy backfitting 算法去识别一个
APR, 且每个 positive bags 中至少有一个 instance 保留在该 APR 中。然后，该算法使用
此 APR 进一步获得最有识别力的特征。最后，核密度估计被使用以进一步泛化模型。

# Learnability

在 multi-instance learning 框架下的 ARP的 PAC-learnability 结论总结如下表：其中
`$1-\varepsilon$`和`$\delta$`表示 accuracy 和 confidence，`$d$`和`$n$`分别表示 APR
的维度和每个 bag 中的 instance 数量。同时，这里`$\tilde{O}$`表示对数项已经被包含。

|Work|Sample complexity|Running time|Main assumptions|
|:-:|:-:|:-:|:-:|
|Long & Tan|`$O(\frac{d^2n^6}{\varepsilon}\log\frac{nd}{\varepsilon\delta})$`|`$O(\frac{d^5n^{12}}{\varepsilon^{20}}\log^2\frac{nd}{\varepsilon \delta})$`|independent instances,  product distribution,   `$n$`is constant|
|Auer et al.|`$O(\frac{d^2n^2}{\varepsilon^2}\log\frac{d}{\delta})$`|`$\tilde{O}(\frac{d^3n^2}{\varepsilon^2})$`|independent instances,  `$n$` is constant|
|Blum & Kalai|`$\tilde{O}(\frac{d^2n}{\varepsilon})$`|`$\tilde{O}(\frac{d^3n^2}{\varepsilon^2})$`|independent instances,   `$n$` is constant|

这些工作丰富了计算机 learning 理论，展示了一些 multi-instance learning 算法设计的
insight。

# Learning Algorithm

supervised learning 和 multi-instance learning 的主要区别是能否(较好地)识别instances。
 
目前大部分现存的 multi-instance learning 算法均是从 supervised learning algorithm 
改进而得到的：将 supervised learning algorithms 的 focuses 从识别 instances 转移到
识别 bags。此处主要介绍检验了五种算法。

## Diverse Density

Diverse Density 算法将每个 bag 当作一个包含许多特征向量(instance)的 manifold，并
且假定一个新的 positive bag 与所有 positive 的 feature-manifolds 相关，而与 negative
feature-manifolds 不相关。目标是计算一个点在 feature space 中的 maximum diverse density。

给定一个数据集`$D$`和一组类别标签`$C=\{c_1,c_2,\cdots,c_t\}$`去预测，在假定
`$P_r(D)$`为常数和`$c_k$`服从均匀分布的基础上，利用 Bayes rule，标签的后验概率计算
为
`\begin{equation}
  \begin{aligned}
    Obj &=Pr(C|D)]\\
        &\propto \mathop{\arg \max}\limits_{1\leqslant k\leqslant t}P_r(D|c_k)
  \end{aligned}\tag{1}
\end{equation}`
公式 (1) 在目标是区分 instances 时已经足够，但是对于区分 bag 时，需要考虑
`$D = \{B_1^+,\cdots,B_m^+,B^-_1,\cdots,B_n^-\}$`，其中`$B_i^+$`和`$B_j^-$`分别表示
第`$i$`个 positive bag 和第`$j$`个 negative bag。在假定 bag 间是条件独立的基础上，
再次利用 Bayes rule，公式 (1) 进一步得到如下：
`$$Obj = \mathop{\arg\max}\limits_{1\leqslant k\leqslant t}\prod_{1\leqslant i\leqslant m}Pr(c_k|B^+_i)\prod_{1\leqslant j\leqslant n}Pr(c_k|B_j^{-})$$`

此即一个 class label 的最大后验概率，具体地，一个 feature space 中特定的点`$x$`的
class label 如公式 (2) 所示，其中`$(x=c_k)$`意味`$x$`的 label 为`$c_k$`。  
`\begin{equation}
Obj^x= \mathop{\arg\max}\limits_{1\leqslant k \leqslant t}
\prod_{1\leqslant i\leqslant m}Pr(x=c_k|B^+_i)
\prod_{1\leqslant j\leqslant n} Pr(x=c_k|B^-_j)\tag{2}
\end{equation}`

进一步，如果我们想在 feature space中 找到一个点，在这个点上，特定的 class label `$c_h$` 的
最大后验概率是最大的，这个点可以通过下式确定：
`\begin{align}\hat{x}&=\mathop{\arg\max}\limits_{x}Pr(Obj^x=c_h)\notag\\&=\mathop{\arg\max}\limits_{x}\prod_{1\leqslant i\leqslant m}Pr(x=c_h|B^+_i)\prod_{1\leqslant j\leqslant n}Pr(x=c_h|B^-_j)\notag\end{align}`

上式清晰地定义了 maximum diverse density。  
Diverse Density algorithm 在 `Musk` 数据上的效果不如 Iterated-discrim APR，但是
它并不限制于 `Musk` 数据。同时 EM-DD algorithm 在提出时在 `Musk` 数据上效果是最好的。

<span style="color:red">注意</span>：
此处未搞懂`$c_k$`的具体含义，以及该算法究竟是如何计算得到 bag 的label的，
需要进一步查看相关论文[^1]。

[^1]: O. Maron and T. Lozano-P´erez. A framework for multiple-instance learning. In M.I.
Jordan, M.J. Kearns, and S.A. Solla, Eds. Advances in Neural Information Processing
Systems 10, Cambridge, MA: MIT Press, pp.570–576, 1998.

## Citation-KNN

Citation-KNN 是一个 nearest neighbor algorithm，并借鉴了科学文献中引用和参考的概念，
即在考虑 bag 附件的 bag 的基础上还考虑将相关 bag 视为邻近的 bag。  
在一般的 k-nearest neighbor algorithm 中，每个 object(or instance) 被视作为 feature
space 中的一个 feature vector，且对于两个 feature vector 的距离，常用 Euclidean distance，即
$$
Dist(a,b)=\lVert a-b \rVert.
$$
为判断 bag 的标签，需要对上式进行修改，即采用 minimal Hausdorff distance：给定两个 bag
`$A=\{a_1,\cdots,a_m\}$`和`$B=\{b_1,\cdots,b_n\}$`，其中`$a_i(1\leqslant i \leqslant m)$`和
`$b_j(1\leqslant j \leqslant n)$`是 instance。将其看作两个 feature set，则这两个bag
的距离衡量为
$$
`\begin{aligned}
Dist(A,B)&=\mathop{MIN}\limits_{1\leqslant i\leqslant m,1\leqslant j\leqslant n}(Dist(a_i,b_j))\\
&=\mathop{MIN}\limits_{a\in A}\mathop{MIN}\limits_{b\in B}\lVert a-b\rVert
\end{aligned}`
$$
由于 positive bag 中并非所有 instance 均为 positive，可能会对结果造成一定影响，故而
引用和参考的概念被引用。

<span style="color:red">注意</span>：Citation的具体含义未懂，需要进一步论文[^2].

[^2]: J. Wang and J.-D. Zucker. Solving the multiple-instance problem: a lazy learning
approach. In Proceedings of the 17th International Conference on Machine Learning,
San Francisco, CA, pp.1119–1125, 2000.

下续[Multi-Instance Learning: A Survey(2)](/blog/2023-10-21-multi-instance-learning-a-survey/2023-10-26-multi-instance-learning-a-survey-2/)
