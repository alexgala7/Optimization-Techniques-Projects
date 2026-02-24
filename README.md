# Optimization Techniques | ECE AUTh

Implementation and analysis of optimization algorithms.

## 📦 Deliverable 1: Single-Variable Optimization

Implementation of the **Bisection** and **Golden Section** methods to find the minimum of non-linear functions within the interval $[-1, 4]$.

### 📊 Comparative Analysis & Key Findings

#### 1. Bisection Method
* **Termination Logic:** The algorithm successfully terminates only when $\epsilon < l/2$.
* **Efficiency:** For $l=0.01$ and $\epsilon=0.001$, it converges in 10 iterations with **18 function evaluations**.
* **Sensitivity:** Large $\epsilon$ values lead to numerical oscillations as shown in the analysis.

![Bisection Analysis](Deliverable_1/Plots/bisection_f1_sensitivity.png)

#### 2. Golden Section Search
* **Computational Cost:** Requires 14 iterations for $l=0.01$ but only **15 function evaluations**, making it ideal for "expensive" functions.
* **Behavior:** Shows a consistent "step-like" reduction of the uncertainty interval.

![Golden Section Convergence](Deliverable_1/Plots/golden_section_f1_convergence.png)

| Method | Accuracy ($l$) | Iterations ($k$) | Function Evaluations |
| :--- | :---: | :---: | :---: |
| **Bisection** | $0.01$ | 10 | 18 |
| **Golden Section** | $0.01$ | 14 | 15 |

---

## 📂 Repository Structure

The project is organized into folders per deliverable and sub-folders per objective function for clarity:

* 📂 **`Deliverable_1/`**:
    * 📂 `f1_Analysis/`: Scripts and function definitions for $f_1(x)$.
    * 📂 `f2_Analysis/`: Scripts and function definitions for $f_2(x)$.
    * 📂 `f3_Analysis/`: Scripts and function definitions for $f_3(x)$.
    * 📄 `Deliverable_1_Report.pdf`: Comprehensive technical report.
    * 📄 `Deliverable_1_Assignment.pdf`: The assignment of the first deliverable.
* 📂 **`Plots/`**: Selected visualizations for the README highlights.

---
*Developed as part of the Optimization Techniques course, ECE AUTh.*

---
*Developed as part of the Optimization Techniques course, ECE AUTh.*
