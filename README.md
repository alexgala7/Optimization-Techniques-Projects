# Optimization Techniques | Deliverable 1: Single-Variable Optimization

This repository contains the implementation and comparative analysis of iterative optimization algorithms for single-variable functions. The project focuses on determining the minimum of non-linear functions within a specific interval, evaluating efficiency through iteration counts and function evaluation frequency.

## 📈 Optimization Methods Implemented

1. **Bisection Method:** A robust search algorithm that reduces the uncertainty interval by half in each step using a small constant $\epsilon$.
2. **Golden Section Search:** An optimized method that uses the golden ratio $\phi \approx 0.618$ to reduce the interval, requiring only one new function evaluation per iteration after the initial step.

## 📋 Experimental Setup

Three benchmark functions ($f_1, f_2, f_3$) were analyzed within the initial interval **$[-1, 4]$**.
* **Accuracy Threshold ($l$):** Investigated for values from $0.01$ down to $10^{-15}$.
* **Distance Constant ($\epsilon$):** Evaluated for its impact on convergence and termination criteria in the Bisection method.

## 📊 Comparative Analysis & Key Findings

### 1. Bisection Method
* **Termination Logic:** The algorithm successfully terminates only when $\epsilon < l/2$.
* **Efficiency:** For $l=0.01$ and $\epsilon=0.001$, the method converges in 10 iterations with **18 function evaluations**.
* **Trade-off:** Increasing $l$ speeds up the process but significantly reduces the approximation accuracy.



### 2. Golden Section Search
* **Computational Cost:** For $l=0.01$, it requires 14 iterations but only **15 function evaluations**. This makes it superior when the objective function is computationally "expensive".
* **Precision:** Demonstrated high stability even at extreme precision requirements ($l \approx 10^{-15}$).
* **Behavior:** Shows a consistent "step-like" reduction of the interval $[a, b]$ as a function of the iteration index $k$.



| Method | Accuracy ($l$) | Iterations ($k$) | Function Evaluations |
| :--- | :---: | :---: | :---: |
| **Bisection** | $0.01$ | 10 | 18 |
| **Golden Section** | $0.01$ | 14 | 15 |

## 📂 Repository Structure

* 📄 **`Ex_1_... .m`**: Bisection method implementation files.
* 📄 **`Ex_2_... .m`**: Golden Section search implementation files.
* 📄 **`f1.m`, `f2.m`, `f3.m`**: Objective function definitions.
* 📂 **`Plots/`**: Visualization of convergence and interval reduction.
* 📄 **`Deliverable_1_Report.pdf`**: Detailed technical report and numerical results.

---
*Developed as part of the Optimization Techniques course, ECE AUTh.*
