---
title: 'Multi-Instance Learning: A Survey'
author: Myosotics
date: '2023-10-21'
slug: []
categories:
  - Article
tags:
  - Computer Science
  - Machine Learnging
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




