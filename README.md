# High performace computing project (Systolic Arrays for NTT)

# 🔐 NTT Systolic Array Accelerator

[![Verilog](https://img.shields.io/badge/HDL-Verilog-blue.svg)](https://en.wikipedia.org/wiki/Verilog)
[![Build](https://img.shields.io/badge/build-passing-brightgreen.svg)](#)
[![License: MIT](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)

Hardware-accelerated implementations of the **Number Theoretic Transform (NTT)** using **systolic arrays** for applications in **post-quantum cryptography**, particularly lattice-based protocols like **Kyber** and **Dilithium**.

This project explores **1D and 2D systolic array** architectures designed in Verilog and validated through simulation and waveform analysis.

---

## 🧠 Background

The **NTT** is a modular analog of the Fast Fourier Transform (FFT). It transforms an input vector:

$$
a = [a_0, a_1, \dots, a_{n-1}]
$$

to an output vector:

$$
A_k = \sum_{j=0}^{n-1} a_j \cdot \omega^{kj} \mod p
$$

Where:
- \( $\omega$ \) is a primitive \( n \)-th root of unity modulo a prime \( p \)
- All operations are done in \( $\mathbb{Z}_p$ \), ensuring exact arithmetic for cryptographic reliability

---

## 💾 Files

| File         | Description |
|--------------|-------------|
| `NTT[1-4].v`       | Verilog module implementing NTT using 1D systolic array logic |
| `NTT[5].v`         | Verilog module implementing NTT using 2D systolic array logic |
| `Makefile`         | Simulation automation script for building and testing with a simulator like ModelSim or Icarus Verilog |
| `Final-Report.pdf` | Full research report detailing theory, design space, architecture schematics, and methodology followed|

---

## ⚙️ Simulation Instructions

### 🔧 Requirements

- Verilog simulator: [Icarus Verilog](http://iverilog.icarus.com/)
- GNU Make

### ▶️ Run the Simulation

```bash
make
