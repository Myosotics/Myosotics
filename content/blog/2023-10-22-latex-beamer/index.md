---
title: Latex模板讲解——beamer
author: Myosotics
date: '2023-10-22'
slug: []
categories:
  - Note
  - Example
  - Coding
tags:
  - Latex
  - Beamer
---

# 导言区

1. `\documentclass{beamer}`用以规定文档的类型 beamer 。
2. 参考文献格式设置
`\usepackage[citestyle=authoryear,bibstyle=numeric,sorting=ynt]{biblatex}`: 即为
引用`biblatex`包。对于`citestyle=authoyear`



这里主要解释如下代码：

```latex
\documentclass{beamer}
% 中文文档，字体，数学，画图包
\usepackage{ctex, hyperref}
\usepackage[T1]{fontenc}
\usepackage{latexsym,amsmath,xcolor,multicol,booktabs,calligra}
\usepackage{graphicx,pstricks,listings,stackengine}
\usepackage{SUFE} % SUFE.sty

% 参考文献格式和源
\usepackage[citestyle=authoryear,bibstyle=numeric,sorting=ynt]{biblatex}
\addbibresource{ref.bib}

% 标题页内容
\author[Peijie Fang, Stefan]{方培杰\inst{1} \and 杰培方\inst{2}} % 中括号内为简略名，于底栏显示
\title[SUFE Template]{上海财经大学Beamer模板}
\subtitle{上海财经大学Beamer模板}
\institute[SUFE] % (optional)
{
  \inst{1}上海财经大学金融学院
  \and
  \inst{2}西安交通大学金禾经济研究中心
}
\date[Pre Date]{\today}

\begin{document}
\kaishu
\begin{frame}
    \titlepage % 显示
    \begin{figure}[htpb] % logo
        \begin{center}
            \includegraphics[width=0.2\linewidth]{pic/SUFE_Logo.eps}
        \end{center}  
    \end{figure}
\end{frame}

\begin{frame} % 设置目录格式，后面每有一个section，本页就会自动显示出来
 \tableofcontents[sectionstyle=show,subsectionstyle=show/shaded/hide,subsubsectionstyle=show/shaded/hide]
\end{frame}

\section{课题背景}

\begin{frame}{Beamer简易入门}
 \begin{itemize}[<+-| alert@+>] % 当然，除了alert，手动在里面插 \pause 也行
  \item 很多学校都有自己的Beamer主题
  \item 但是上海财经大学没有
  \item 中文支持请选择 Xe\LaTeX{} 编译选项
  \item \href{http://tug.ctan.org/macros/latex/contrib/beamer/doc/beameruserguide.pdf}{\color{sufered}{Beamer官方手册}}~和 \href{https://www.overleaf.com/learn}{\color{sufered}{Overleaf简易教程}}都是不错的入门参考
 \end{itemize}
\end{frame}

\section{研究现状}

\subsection{Beamer主题资源}

\begin{frame}{Beamer主题资源}
 \begin{itemize}
  \item 有一些 \LaTeX{} 自带的
  \item 有一些社区的
  \item 一个模板网站：\href{http://www.latextemplates.com/}{\color{sufeblue}{戳我}}
 \end{itemize}
\end{frame}


\section{研究内容}

\subsection{美化主题}

\begin{frame}{本主题的特点}
 \begin{itemize}
  \item 中文采用楷书
  \item 使用{\color{sufered}{财大红}}作为主色调：CMYK(50 100 100 20)
  \item 另有{\color{sufeblue}{经世蓝}}为备选色调：CMYK(100 85 31 0)
  \item 颜色选择参见{\color{sufered}{SUFE.sty}}
  \item 本主题基于THU Beamer修改\footnote{\url{https://www.latexstudio.net/archives/3634}}
  \end{itemize}
\end{frame}

 \subsection{如何更好地做Beamer}
 
 \begin{frame}{Why Beamer}
  \begin{itemize}
   \item \LaTeX 广泛用于学术界，期刊会议论文模板
  \end{itemize}
  \begin{table}[h]
   \centering
   \begin{tabular}{c|c}
    Microsoft\textsuperscript{\textregistered}  Word & \LaTeX \\
    \hline
    文字处理工具 & 专业排版软件 \\
    容易上手，简单直观 & 容易上手 \\
    所见即所得 & 所见即所想，所想即所得 \\
    高级功能不易掌握 & 进阶难，但一般用不到 \\
    处理长文档需要丰富经验 & 和短文档处理基本无异 \\
    花费大量时间调格式 & 无需担心格式，专心作者内容 \\
    公式排版差强人意 & 尤其擅长公式排版 \\
    二进制格式，兼容性差 & 文本文件，易读、稳定 \\
    付费商业许可 & 自由免费使用 \\
   \end{tabular}
  \end{table}
 \end{frame}
 
 \begin{frame}{排版举例}
  \begin{exampleblock}{无编号公式} % 加 * 
   \begin{equation*}
	U(x, y)=\left[x^{\delta}+y^{\delta}\right]^{\frac{1}{\delta}}
   \end{equation*}
  \end{exampleblock}
  \begin{exampleblock}{多行多列公式\footnote{如果公式中有文字出现，请用 $\backslash$mathrm\{\} 或者 $\backslash$text\{\} 包含，不然就会变成 $clip$，在公式里看起来比 $\mathrm{clip}$ 丑非常多。}}
   % 使用 & 分隔
\begin{align}
	\frac{\partial v(p, w)}{\partial p_{k}} &=\frac{\partial\left[u\left(x^{*}\right)+\lambda\left(w-p \cdot x^{*}\right)\right]}{\partial p_{k}} \\
	&=-\lambda x_{k}^{*}=-\frac{u_{j}\left(x^{*}\right)}{p_{j}} x_{k}^{*} \nonumber
\end{align}
  \end{exampleblock}
 \end{frame}
 
 \begin{frame}
  \begin{exampleblock}{编号多行公式}
   % Taken from Mathmode.tex
   \begin{multline}
\begin{aligned}
	v^{\prime}(q) &=\frac{d f(x(q) ; q)}{d q} \\
	&=\underbrace{\frac{\partial f(x(q) ; q)}{\partial q}}_{\text {Direct effect }}+\underbrace{\frac{\partial f(x(q) ; q)}{\partial x} \frac{\partial x(q)}{\partial q}}_{\text {Indirect effect }} \\
	&=\frac{\partial f(x(q) ; q)}{\partial q} .
\end{aligned}
   \end{multline}
  \end{exampleblock}
 \end{frame}
 
\begin{frame}{图形与分栏}
 	\begin{minipage}[c]{0.3\linewidth}
 			\begin{figure}[htpb]
 			\centering
 			\includegraphics[width=.4\textheight]{pic/SUFE_Header.eps}
 			 \caption{这是校名}
 		\end{figure}
	\end{minipage}\hspace{1cm}
\begin{minipage}{0.5\linewidth}
	\medskip
	%\hspace{2cm}
	\begin{figure}[htpb]
		\centering
		\includegraphics[width=.4\textheight]{pic/SUFE_Logo.eps}
		 			 \caption{这是校徽}
	\end{figure}
\end{minipage}
 \end{frame}
 
 \begin{frame}[fragile]{\LaTeX{} 常用命令}
  \begin{exampleblock}{命令}
   \centering
   \footnotesize
   \begin{tabular}{llll}
    \cmd{chapter} & \cmd{section} & \cmd{subsection} & \cmd{paragraph} \\
    章 & 节 & 小节 & 带题头段落 \\\hline
    \cmd{centering} & \cmd{emph} & \cmd{verb} & \cmd{url} \\
    居中对齐 & 强调 & 原样输出 & 超链接 \\\hline
    \cmd{footnote} & \cmd{item} & \cmd{caption} & \cmd{includegraphics} \\
    脚注 & 列表条目 & 标题 & 插入图片 \\\hline
    \cmd{label} & \cmd{cite} & \cmd{ref} \\
    标号 & 引用参考文献 & 引用图表公式等\\\hline
   \end{tabular}
  \end{exampleblock}
  \begin{exampleblock}{环境}
   \centering
   \footnotesize
   \begin{tabular}{lll}
    \env{table} & \env{figure} & \env{equation}\\
    表格 & 图片 & 公式 \\\hline
    \env{itemize} & \env{enumerate} & \env{description}\\
    无编号列表 & 编号列表 & 描述 \\\hline
   \end{tabular}
  \end{exampleblock}
 \end{frame}
 
 \begin{frame}[fragile]{\LaTeX{} 环境命令举例}
  \begin{minipage}{0.5\linewidth}
  	% 这里的代码区块空格会显示，所以顶格写，不能用Tab，否则会显示为^I
   \begin{lstlisting}[language=TeX] 
\begin{itemize}
  \item A \item B
  \item C
  \begin{itemize}
  \item C-1
  \end{itemize}
\end{itemize}
\end{lstlisting}
  \end{minipage}\hspace{1cm}
  \begin{minipage}{0.3\linewidth}
   \begin{itemize}
    \item A
    \item B
    \item C
    \begin{itemize}
     \item C-1
    \end{itemize}
   \end{itemize}
  \end{minipage}
  \medskip
  \pause
  \begin{minipage}{0.5\linewidth}
   \begin{lstlisting}[language=TeX]
\begin{enumerate}
  \item 本科 \item 硕士
  \item 博士
  \begin{itemize}
    \item[总结] 学海无涯
  \end{itemize}
\end{enumerate}
\end{lstlisting}
  \end{minipage}\hspace{1cm}
  \begin{minipage}{0.3\linewidth}
\begin{enumerate}
  \item 本科
  \item 硕士
  \item 博士
  \begin{itemize}
     \item[总结] 学海无涯
  \end{itemize}
\end{enumerate}
  \end{minipage}
 \end{frame}
 
 \begin{frame}[fragile]{\LaTeX{} 数学公式}
  \begin{columns}
   \begin{column}{.55\textwidth}
    \begin{lstlisting}[language=TeX]
$V = \frac{4}{3}\pi r^3$
 
\[
V = \frac{4}{3}\pi r^3
\]
 
\begin{equation}
\label{eq:vsphere}
V = \frac{4}{3}\pi r^3
\end{equation}
    \end{lstlisting}
   \end{column}
   \begin{column}{.4\textwidth}
    $V = \frac{4}{3}\pi r^3$
    \[
    V = \frac{4}{3}\pi r^3
    \]
    \begin{equation}
     \label{eq:vsphere}
     V = \frac{4}{3}\pi r^3
    \end{equation}
   \end{column}
  \end{columns}
  \begin{itemize}
   \item 更多内容请看 \href{https://zh.wikipedia.org/wiki/Help:数学公式}{\color{purple}{这里}}
  \end{itemize}
 \end{frame}
 
 \begin{frame}[fragile]
  \begin{columns}
   \column{.6\textwidth}
   \begin{lstlisting}[language=TeX]
\begin{table}[htbp]
 \caption{符号与含义}
 \label{tab:number}
 \centering
 \begin{tabular}{cl}
\toprule
符号 & 含义 \\
\midrule
1 & 4.0 \\
2 & 3.7 \\
\bottomrule
 \end{tabular}
\end{table}
公式~(\ref{eq:vsphere}) 的
符号与含义请参见
表~\ref{tab:number}。
   \end{lstlisting}
   \column{.4\textwidth}
   \begin{table}[htpb]
    \centering
    \caption{符号与含义}
    \label{tab:number}
    \begin{tabular}{cl}\toprule
     符号 & 含义 \\\midrule
     $r$ & 半径\\
     $V$ & 体积\\\bottomrule
    \end{tabular}
   \end{table}
   \normalsize 公式~(\ref{eq:vsphere})的符号与含义请参见表~\ref{tab:number}。
  \end{columns}
 \end{frame}
 
 \begin{frame}{作图}
  \begin{itemize}
   \item 矢量图 eps, ps, pdf
   \begin{itemize}
    \item METAPOST, pstricks, pgf $\ldots$
    \item Xfig, Dia, Visio, Inkscape $\ldots$
    \item Matlab / Excel 等保存为 pdf
   \end{itemize}
   \item 标量图 png, jpg, tiff $\ldots$
   \begin{itemize}
    \item 提高清晰度，避免发虚
    \item 应尽量避免使用
   \end{itemize}
  \end{itemize}
  \begin{figure}[htpb]
   \centering
   \includegraphics[width=0.5\linewidth]{pic/SUFE_Logo_Header.eps}
   \caption{上海财大校徽矢量图}
  \end{figure}
 \end{frame}
 
 \section{计划进度}
 \begin{frame}
  \begin{itemize}
   \item 一月：完成文献调研
   \item 二月：复现并评测各种Beamer主题美观程度
   \item 三、四月：美化SUFE Beamer主题
   \item 五月：论文撰写
  \end{itemize}
 \end{frame}
 
 \section{参考文献}
 \begin{frame}{biblatex文内引用效果展示}

 	 无括号，含前后缀：\cite[参考][Page 10]{barro1990}
 	 
 	 圆括号：\parencite{diamondl1965}
 	 
 	 脚注式：见本页左下方\footcite{张春霖2000}
 	 
 	 多篇引用：\cite{Greiner2008,马拴友,greenwood2015,green2020}
 	 
 \end{frame}
 
\begin{frame}[allowframebreaks]{}
  \printbibliography
\end{frame}
 
 \begin{frame}
  \begin{center}
   {\Huge\calligra Thanks!}
  \end{center}
 \end{frame}

\end{document}
```
