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

## 📦 Deliverable 2: Multi-Variable Optimization

This deliverable explores second-order and gradient-based optimization methods, focusing on the impact of starting points, step-size strategies, and Hessian matrix properties.

### 📉 Objective Function Overview
A 3D surface analysis of the objective function revealed a global minimum at $\approx -0.8106$ and a stationary saddle point at $(0, 0)$.

![3D Surface Analysis](Plots/function_3d_surface.png)


### 🚀 Comparison of Methods & Strategies

The performance was evaluated using three primary starting points:
* **(i) (0, 0):** Stationary point trap.
* **(ii) (-1, 1):** Vicinity of the global minimum.
* **(iii) (1, -1):** Remote point, prone to saddle point capture.

#### 1. Steepest Descent (Gradient Descent)
* **Finding:** Constant step size is inefficient. The **Optimal Step** (via Bisection) and **Armijo Rule** showed superior performance, reaching the minimum in **7-8 iterations** from point (ii).
* **Trap Escape:** For point (iii), increasing the search space for $\gamma$ from $[0, 1]$ to $[0, 4]$ was necessary to escape the $(0, 0)$ attractor.

#### 2. Newton's Method
* **Limitation:** Highly unstable in non-convex regions. Due to **negative definite Hessians**, the method consistently failed to reach the global minimum from points (ii) and (iii), converging instead to the saddle point.
* **Key Insight:** Newton's method reached the minimum in only **4 iterations** but only when initialized in a strictly convex region (e.g., -1.5, 0.5).

#### 3. Levenberg-Marquardt (L-M)
* **Optimization:** The most robust method. By ensuring a positive definite Hessian ($\nabla^2 f + \mu I$), it successfully navigated to the global minimum.
* **Peak Efficiency:** Combined with the **Armijo Rule**, L-M achieved convergence in just **6 iterations**.

![Method Comparison Convergence](Plots/convergence_comparison.png)


### 📊 Comparative Performance Summary (Point ii)
| Method | Step Strategy | Iterations | Status |
| :--- | :--- | :---: | :---: |
| **Steepest Descent** | Optimal $\gamma_k$ | 7 | ✅ Success |
| **Newton** | Fibonacci Search | 9548 | ❌ Trapped |
| **Levenberg-Marquardt**| Armijo Rule | **6** | ✅ Optimal |

---

## 📂 Repository Structure (Deliverable 2)

To maintain organization, the code is structured by method:

* 📂 **`Deliverable_2/`**:
    * 📂 `Visualization/`: `Ex_1.m` (3D Plotting).
    * 📂 `Steepest_Descent/`: Scripts `Ex_2_a,b,c` and line search routines.
    * 📂 `Newton_L_M/`: Newton and Levenberg-Marquardt implementations.
    * 📂 `Utils/`: `fibonacci_method.m`, `find_gamma_armijo.m`.
    * 📄 `Deliverable_2_Report.pdf`: Detailed analysis of Hessian eigenvalues and criteria.

---
