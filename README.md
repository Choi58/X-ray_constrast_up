## 🔬 X-ray Contrast Enhancement using Multi-Frequency Histogram and PCHIP

> 📌 This project was presented as a poster at **IPIU 2020** (Image Processing and Image Understanding Workshop).  
> **Title:** 다중 주파수를 이용한 X선 촬영 이미지의 대비 향상 알고리즘  
> **Date:** 2020.02

This repository implements a contrast enhancement algorithm for X-ray images using multi-frequency histogram analysis and Piecewise Cubic Hermite Interpolating Polynomial (PCHIP) interpolation. The method improves the visibility of bone structures by analyzing the image histogram and applying a smooth intensity mapping.

### 🛠 Features

- Multi-frequency histogram analysis for contrast mapping
- PCHIP interpolation to preserve smooth, monotonic transformations
- MATLAB-based implementation
- Visualization of enhancement results
- 실험적으로 다양한 k값에 따른 비교 (`k=15~18`)

### 📊 Experimental Comparison

📄 See [elbow.pdf](elbow.pdf)  
This document compares the effect of varying the number of control points (`k=15~18`) on contrast enhancement.  
It includes annotated images highlighting the clarity of bone boundaries (ulna, radius, humerus).
