---
title: The Moreau Decomposition Property of Proximal Operators
author: Myosotics
date: '2024-08-16'
categories:
  - Note
tags:
  - Mathematical Technique
---

对于 The Moreau Decomposition Property of Proximal Operators，首先给出其描述如下：

给定 proximal operator 

$$
\mathrm{prox}_{h}(x)=\mathop{\mathrm{argmin}}\_\limits{u}\  h(u)+\frac12\lVert u-x \rVert^2_2,
$$
相应 Moreau decomposition property 为

$$
x=\mathrm{prox}_{h}+\mathrm{prox}\_{ h^{ \ast }}(x),
$$
其中 `$h^\ast$` 为 `$h$` 的共轭函数，即

$$
h^\ast(x) = \sup_{u\in \mathrm{dom}(h)}\{<u,x>-h(u)\}
$$

相应给出其证明如下：

定义 `$u=\mathrm{prox}_h(x)$` 和 `$v = x-u$`。

由邻近算子的定义，可知：

$$
x-u\in\partial h(u),
$$
故 `$v\in\partial h(u)$`。下面只需说明 `$u=x-v\in\partial h^\ast(v)$`，结论`$v=\mathrm{prox}_{h^\ast}(x)$` 即成立。

下面说明 `$u=x-v\in\partial h^\ast(v)$`，证明过程参考：[https://math.stackexchange.com/questions/693687/proof-of-the-moreau-decomposition-property-of-proximal-operators](https://math.stackexchange.com/questions/693687/proof-of-the-moreau-decomposition-property-of-proximal-operators)

假设 `$v\in\partial h(u)$`，则有
`$$
h(x)\geqslant h(u)+<v,x-u>\quad \text{for all }x,\tag{1}\label{1}
$$`
从而在 `$u$` 处存在给定斜率 `$v$` 的函数 `$h$` 的 affine minorant。

进一步，若存在给定斜率 `$v$` 的函数 `$h$` 的 affine minorant，则由
`$$
\begin{aligned}
&\qquad\quad h(x)\geqslant <v,x>-\alpha\quad \text{for all }x\\
              &\iff \alpha\geqslant<v,x>-h(x) \quad \text{for all }x \\
              &\iff \alpha \geqslant \sup_{x}<v,x>-h(x) \\
              & \iff \alpha \geqslant h^\ast(v), 
\end{aligned}
$$`
知`$\alpha(x)=<v,x>-h^\ast(v)$`为给定斜率 `$v$` 的函数 `$h$` 的 affine minorant，同时`$h(u)\geqslant \alpha(u)$`。
此外，由\eqref{1}可知，`$\alpha(x)\geqslant h(u)+<v,x-u>$`，从而`$\alpha(u)\geqslant h(u)+<v,u-u>$`，故而有
`$$
\begin{aligned}
h^\ast(v) &= <u,v>-h(u)\\
&= <u,v>-h^{\ast\ast}(u)
\end{aligned}$$`。

结合上述论证，同理可知`$<u,v>-h^{\ast\ast}(u)$`为`$h^\ast$`的一个affine minorant。故而有
`$$
u\in\partial h^\ast(v).
$$`






