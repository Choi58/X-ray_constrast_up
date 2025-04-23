# 🔬 X-ray Contrast Enhancement using PCHIP

This project enhances the contrast of X-ray images using histogram analysis and PCHIP (Piecewise Cubic Hermite Interpolating Polynomial) interpolation. It was originally developed for a school project in 2019 and implements a custom image enhancement method aimed at medical imaging clarity.

---

## 📌 Overview

X-ray images often suffer from low contrast, making it difficult to identify fine structures. This project proposes a method that:
- Extracts meaningful control points from the image histogram.
- Applies PCHIP interpolation to generate a smooth and contrast-enhancing mapping curve.
- Enhances the image by applying this transformation.

---

## 🛠 Features

- Histogram-based contrast point selection
- PCHIP interpolation to preserve monotonicity and smoothness
- Visualization of enhancement results
- MATLAB implementation

---

## 🚀 How to Run

1. Open `Enhancing_Contrast.m` in MATLAB.
2. Set the image path or use the built-in sample image.
3. Run the script to generate enhanced results and plots.


