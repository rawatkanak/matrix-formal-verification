# Debug Notes

## Overview

This document summarizes debugging observations and issues encountered during simulation and formal verification.

---

# Simulation Debugging

## Waveform Inspection

Waveforms were analyzed using GTKWave.

The following signals were monitored:

* clk
* rst
* start
* done
* c00
* c01
* c10
* c11

---

# Simulation Checks Performed

| Check                  | Result |
| ---------------------- | ------ |
| Clock Generation       | Passed |
| Reset Behavior         | Passed |
| FSM Transition         | Passed |
| Output Generation      | Passed |
| Arithmetic Correctness | Passed |

---

# Formal Verification Debugging

## Observed Warning

```text
Wire is used but has no driver
```

---

# Root Cause

Formal verification tools treat unconstrained inputs as symbolic variables.

Inputs such as:

* a00
* a01
* b00
* b01
* start
* rst

were intentionally left unconstrained for exhaustive exploration.

This behavior is expected in formal verification environments.

---

# SMTBMC Engine Issue

## Observed Error

```text
engine_0: failed to create process
```

---

# Possible Cause

Potential compatibility issue between:

* MSYS2 environment
* Python installation
* yosys-smtbmc process execution
* Windows shell handling

---

# Debugging Steps Performed

## Tool Verification

The following tools were validated successfully:

| Tool         | Status   |
| ------------ | -------- |
| Yosys        | Verified |
| SymbiYosys   | Verified |
| yosys-smtbmc | Verified |
| Z3 Solver    | Verified |

---

# Commands Executed

## Verify Z3

```bash
z3 --version
```

## Run Formal Verification

```bash
python ~/formal_projects/sby/sbysrc/sby.py -f matrix_mul.sby
```

## Verify SMTBMC

```bash
yosys-smtbmc -h
```

---

# Waveform Debugging

Waveforms confirmed:

* Correct clock toggling
* Proper reset behavior
* Correct FSM sequencing
* Stable outputs
* Expected arithmetic outputs

---

# Final Observation

Although the SMTBMC engine encountered a Windows process launch issue, the project successfully demonstrates:

* Formal verification setup
* Assertion development
* Property specification
* Simulation verification
* Verification methodology understanding
* Waveform analysis skills
