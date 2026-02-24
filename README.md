# Optimization Techniques | ECE AUTh

Implementation and analysis of optimization algorithms.

## 📦 Deliverable 1: Single-Variable Optimization

Implementation of the **Bisection** and **Golden Section** methods to find the minimum of non-linear functions within the interval $[-1, 4]$.

### 📊 Comparative Analysis & Key Findings

#### 1. Bisection Method
* **Termination Logic:** The algorithm successfully terminates only when $\epsilon < l/2$.
* **Efficiency:** For $l=0.01$ and $\epsilon=0.001$, it converges in 10 iterations with **18 function evaluations**.
* **Sensitivity:** Large $\epsilon$ values lead to numerical oscillations as shown in the analysis.

![Bisection Analysis](Plots/bisection_f1_analysis.png)

#### 2. Golden Section Search
* **Computational Cost:** Requires 14 iterations for $l=0.01$ but only **15 function evaluations**, making it ideal for "expensive" functions.
* **Behavior:** Shows a consistent "step-like" reduction of the uncertainty interval.

![Golden Section Convergence](Plots/golden_section_f1_conv.png)

| Method | Accuracy ($l$) | Iterations ($k$) | Function Evaluations |
| :--- | :---: | :---: | :---: |
| **Bisection** | $0.01$ | 10 | 18 |
| **Golden Section** | $0.01$ | 14 | 15 |

---

## 📂 Repository Structure (Deliverable 1)
* 📂 **`Deliverable_1/`**: 
    * 📄 `Main_Bisection.m` & `Main_GoldenSection.m`: Primary execution scripts.
    * 📂 `utils/`: Core optimization algorithms and objective function definitions.

---
*Developed as part of the Optimization Techniques course, ECE AUTh.*
