# Verification Methodology

## Verification Strategy

The project follows a hybrid verification methodology:

1. RTL Design
2. Simulation Verification
3. Assertion Development
4. Formal Property Verification
5. Waveform Analysis
6. Debug and Validation

---

# Simulation Verification

Simulation verification validates:

* Reset behavior
* FSM transitions
* Data propagation
* Arithmetic correctness
* Output timing

Directed test vectors were applied using a SystemVerilog testbench.

---

# Formal Verification

Formal verification was implemented using:

* SymbiYosys
* SMTBMC
* Z3 Solver

Properties were checked using bounded model checking (BMC).

The formal environment validates:

* Correct matrix multiplication
* Stable outputs
* Correct DONE behavior
* Sequential correctness

---

# Assertion-Based Verification

Assertions were written to ensure mathematical correctness of outputs.

Assertions are evaluated when the DONE signal becomes active.

---

# Waveform Analysis

Waveforms were analyzed using GTKWave to validate:

* Clock behavior
* Reset sequencing
* FSM operation
* Output correctness
* Timing behavior
