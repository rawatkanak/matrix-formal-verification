# Matrix Multiplication Formal Verification Project

## Overview

This project implements and verifies a 2x2 matrix multiplication accelerator using SystemVerilog and formal verification methodologies.

The project demonstrates:

* RTL Design using SystemVerilog
* FSM-based hardware implementation
* Simulation-based verification
* Assertion-Based Verification (ABV)
* Formal verification using SymbiYosys
* Bounded Model Checking (BMC)
* Waveform debugging and analysis

---

# Design Description

The DUT performs multiplication of two 2x2 matrices.

## Matrix Equation

If:

A =

```text
[a00 a01]
[a10 a11]
```

and

B =

```text
[b00 b01]
[b10 b11]
```

Then:

```text
c00 = (a00*b00) + (a01*b10)
c01 = (a00*b01) + (a01*b11)
c10 = (a10*b00) + (a11*b10)
c11 = (a10*b01) + (a11*b11)
```

---

# Verification Methodology

The project uses a hybrid verification flow:

## 1. Simulation Verification

* Directed testbench
* Waveform analysis
* Output validation
* FSM verification

## 2. Formal Verification

Implemented using:

* SymbiYosys
* SMTBMC
* Z3 Solver
* Yosys SMT backend

Formal properties verify:

* Arithmetic correctness
* FSM behavior
* Output validity
* Sequential correctness

---

# Assertions Used

```systemverilog
assert(c00 == ((a00*b00)+(a01*b10)));
assert(c01 == ((a00*b01)+(a01*b11)));

assert(c10 == ((a10*b00)+(a11*b10)));
assert(c11 == ((a10*b01)+(a11*b11)));
```

---

# Tools Used

| Tool          | Purpose            |
| ------------- | ------------------ |
| SystemVerilog | RTL + Verification |
| Yosys         | Synthesis          |
| SymbiYosys    | Formal Flow        |
| SMTBMC        | Model Checking     |
| Z3            | SMT Solver         |
| GTKWave       | Waveform Analysis  |
| VS Code       | Development        |

---

# Simulation

## Compile

```bash
iverilog -g2012 -o sim.out rtl/matrix_mul.sv sim/matrix_mul_tb.sv
```

## Run

```bash
vvp sim.out
```

## Open Waveform

```bash
gtkwave wave.vcd
```

---

# Formal Verification

## Run SymbiYosys

```bash
sby -f formal/matrix_mul.sby
```

---

# Verification Concepts Demonstrated

* Assertion-Based Verification
* Temporal Assertions
* Formal Property Checking
* Bounded Model Checking
* FSM Verification
* Waveform Debugging
* RTL Verification Methodology

---

# Industry-Relevant Skills

This project demonstrates concepts used in ASIC/FPGA verification roles:

* Formal verification methodologies
* RTL understanding
* Assertion writing
* Property checking
* Verification planning
* Debugging and analysis
---

Author: Kanak Rawat
Matrix Verification
