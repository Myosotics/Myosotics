---
title: Portfolio Selection with Feature Screening
author: Myosotics
date: '2023-11-10'
slug: []
categories:
  - Coding
tags:
  - Alogorithm
  - Python
---

算法和代码均来自文章：Jin-Hong Du, Yifeng Guo & Xueqin Wang (2023) High-Dimensional Portfolio
Selection with Cardinality Constraints, Journal of the American Statistical Association, 118:542, 779-791, DOI: 10.1080/01621459.2022.2133718.

首先加載`reticulate`包，方便在`Rmarkdown`中使用`Python`。

```r
library(reticulate)
```

```
## Warning: 程辑包'reticulate'是用R版本4.1.3 来建造的
```

```r
use_python('E:/software/Program Files/python3.11.0')
```

# 一个小测试

构建一个数据集用来测试

```python
import numpy as np
n = 20
d = 100
np.random.seed(0)
X = np.random.rand(n,d) + 0.5
X.shape
```

```
## (20, 100)
```

```python
from spo import spo_l1_path
ws, lambdas, gaps, n_iters, n_active_features = spo_l1_path(X, func=0,
    n_lambdas=50, screen=True, max_iter=int(1e4), f=200, tol=1e-3)
```

```
## 
  0%|          | 0/50 [00:00<?, ?it/s]
 74%|#######4  | 37/50 [00:00<00:00, 341.55it/s]
100%|##########| 50/50 [00:00<00:00, 162.49it/s]
```

# 算法框架

![](images/algorithm.png)

