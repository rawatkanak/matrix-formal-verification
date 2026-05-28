# Waveform Analysis

## Overview

Waveform analysis was performed using GTKWave to validate simulation behavior and verify functional correctness of the matrix multiplication accelerator.

---

# Signals Monitored

| Signal | Description              |
| ------ | ------------------------ |
| clk    | System clock             |
| rst    | Reset signal             |
| start  | Input valid/start signal |
| done   | Output valid signal      |
| c00    | Output matrix element    |
| c01    | Output matrix element    |
| c10    | Output matrix element    |
| c11    | Output matrix element    |

---

# Clock Behavior

The clock toggles every 5ns:

```systemverilog
forever #5 clk = ~clk;
```

Waveform inspection confirmed stable clock operation throughout simulation.

---

# Reset Analysis

Reset was asserted at simulation start.

Observed behavior:

* FSM entered IDLE state
* Outputs cleared to zero
* done signal deasserted

Reset release correctly initiated normal operation.

---

# FSM Transition Analysis

The FSM transitions observed were:

```text
IDLE → COMPUTE → DONE → IDLE
```

Waveforms confirmed proper sequential state progression.

---

# Arithmetic Verification

The following matrix multiplication was verified:

## Matrix A

```text
[1 2]
[3 4]
```

## Matrix B

```text
[5 6]
[7 8]
```

---

# Expected Results

```text
c00 = 19
c01 = 22
c10 = 43
c11 = 50
```

---

# Observed Results

Waveforms confirmed correct output generation for all matrix elements.

---

# Output Timing Analysis

Outputs became valid after computation stage completion.

The `done` signal correctly indicated output availability.

---

# Verification Outcome

Waveform analysis successfully validated:

* Correct clock behavior
* Proper reset sequencing
* Correct FSM transitions
* Accurate arithmetic outputs
* Stable registered outputs
* Proper output timing

---

# Conclusion

Waveform debugging confirmed that the DUT behaved according to the expected RTL specification during simulation.
