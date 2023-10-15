---
title: 'A Review on Machine Learning Styles in Computer Vision-Techniques and Future Directions'
author: Myosotics
date: '2023-10-10'
slug: []
categories:
  - Article
tags: 
- Literature
- Review
- Machine Learnging
- Computer Vision
---

# 摘要

## 英文原文

Computer applications have considerably shifted from single data processing to
machine learning in recent years due to the accessibility and availability of
massive volumes of data obtained through the internet and various sources. 
Machine learning is automating human assistance by training an algorithm on 
relevant data. Supervised, Unsupervised, and Reinforcement Learning are the three
fundamental categories of machine learning techniques. In this paper, we have 
discussed the different learning styles used in the field of Computer vision, 
Deep Learning, Neural networks, and machine learning. Some of the most recent 
applications of machine learning in computer vision include object identification,
object classification, and extracting usable information from images, graphic 
documents, and videos. Some machine learning techniques frequently include 
zero-shot learning, active learning, contrastive learning, self-supervised 
learning, life-long learning, semi-supervised learning, ensemble learning, 
sequential learning, and multi-view learning used in computer vision until now. 
There is a lack of systematic reviews about all learning styles. This paper
presents literature analysis of how different machine learning styles evolved in
the field of Artificial Intelligence (AI) for computer vision. This research 
examines and evaluates machine learning applications in computer vision and future forecasting. This paper will be helpful for researchers working with learning 
styles as it gives a deep insight into future directions.

## 翻译

近年来，由于通过互联网和各种来源获得的大量数据的可访问性和可用性，计算机应用已经
从单一数据处理大幅转向机器学习。机器学习通过在相关数据上训练算法来实现人类协助的
自动化。监督学习、无监督学习和强化学习是机器学习技术的三个基本类别。在本文中，我
们讨论了计算机视觉、深度学习、神经网络和机器学习领域中使用的不同学习风格。机器学
习在计算机视觉中的一些最新应用包括对象识别、对象分类以及从图像、图形文档和视频中
提取可用信息。一些直到目前被使用的机器学习技术通常包括零样本学习、主动学习、对比
学习、自监督学习、终身学习、半监督学习、集成学习、顺序学习和多视图学习等。(目前)
缺乏对所有学习方式的系统评估。本文呈现了计算机视觉方面人工智能(AI)领域中不同的机
器学习风格是如何演变的文献分析。本研究考察和评估机器学习在计算机视觉和未来预测中
的应用。这篇论文将有助于研究(机器)学习风格的研究人员，因为它对未来的发展方向有深
刻的见解。

# 文章信息

1. Author: Mahadevkar, V, Supriya and Khemani, Bharti and Patil, Shruti and Kotecha, 
Ketan and Vora, Deepali R. and Abraham, Ajith and Gabralla,Lubna Abdelkareim   
2. Title: A Review on Machine Learning Styles in Computer Vision-Techniques and Future Directions  
3. Journal: IEEE ACCESS  

# 文章框架

<div class="figure" style="text-align: center">
<img src="images/outlineofpapers.png" alt="Outline of papers"  />
<p class="caption"><span id="fig:outlineofpapers"></span>Figure 1: Outline of papers</p>
</div>

# 文章观点

1.机器学习是一种人工智能(AI)，它通过学习和扩展以前的经验来训练计算机像人类一样思考。

2.对于数据的预测和分析任务，机器学习分为三种类型：监督学习、无监督学习和半监督学习。

3.计算机视觉的应用领域、相应的机器学习方式和(Python)程序实现库：
<div class="figure" style="text-align: center">
<img src="images/AIincomputervision.png" alt="AI in computervision"  />
<p class="caption"><span id="fig:AIincomputervision"></span>Figure 2: AI in computervision</p>
</div>
4. 每种机器学习方式的演变发展史：
<div class="figure" style="text-align: center">
<img src="images/evolutionML.png" alt="Evolution of machine learning styles"  />
<p class="caption"><span id="fig:evolutionML"></span>Figure 3: Evolution of machine learning styles</p>
</div>
5. 机器学习风格分类：
<div class="figure" style="text-align: center">
<img src="images/MLtaxonomy.png" alt="Taxonomy of machine learning styles classification"  />
<p class="caption"><span id="fig:MLtaxonomy"></span>Figure 4: Taxonomy of machine learning styles classification</p>
</div>

# 各机器学习风格基本思想

## Primary Styles

文章此处进一步分为了Supervised, Unsupervised, Reinforcement三种类别。

### Supervised

监督学习的机器学习任务是将每个输入项转换为所需的类标签值。监督学习大致分为两类，
即分类和回归。监督学习的流程流如fig <a href="#fig:supervised">5</a> 所示，其输入是经过特征
提取的有标签数据，随后训练模型。训练后的模型将应用于测试数据集来预测结果。性能精
度通过比较预测和实际输出来计算得到。
<div class="figure" style="text-align: center">
<img src="images/supervised.png" alt="Framework of supervised learning"  />
<p class="caption"><span id="fig:supervised"></span>Figure 5: Framework of supervised learning</p>
</div>
监督学习的优点： 

1. 监督学习给出的分类结果比无监督学习的更加准确。
2. 用有标签数据集去训练和测试模型是容易。

监督学习的缺点：

1. 训练数据缺失。
2. 数据质量低。
3. 对于训练数据欠拟合或过度拟合。
4. 机器学习的过程是复杂的。

#### Multiple Instance Learning





