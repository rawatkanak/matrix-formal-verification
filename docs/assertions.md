# Assertions Documentation

## Overview

This document describes the assertions used in the formal verification environment for the matrix multiplication accelerator.

Assertions are written using SystemVerilog Assertion-Based Verification (ABV) methodology.

The assertions verify correctness of the matrix multiplication outputs.

---

# Assertion Strategy

Assertions are checked when the `done` signal becomes active.

This ensures that outputs are validated only after computation completes.

---

# Functional Assertions

```systemverilog
assert(c00 == ((a00*b00)+(a01*b10)));
assert(c01 == ((a00*b01)+(a01*b11)));

assert(c10 == ((a10*b00)+(a11*b10)));
assert(c11 == ((a10*b01)+(a11*b11)));
```

---

# Purpose of Assertions

| Assertion     | Purpose                        |
| ------------- | ------------------------------ |
| c00 Assertion | Verifies first output element  |
| c01 Assertion | Verifies second output element |
| c10 Assertion | Verifies third output element  |
| c11 Assertion | Verifies fourth output element |

---

# Verification Benefits

The assertions provide:

* Arithmetic correctness checking
* Exhaustive state validation
* Early bug detection
* Output consistency verification
* Sequential correctness validation

---

# Assertion-Based Verification (ABV)

ABV enables automatic validation of design properties during formal verification.

Advantages include:

* Faster debug cycles
* Exhaustive verification
* Improved design reliability
* Reduced manual testing effort

---

# Temporal Verification Concept

Assertions are evaluated synchronously on:

```systemverilog
always_ff @(posedge clk)
```

This demonstrates understanding of:

* Temporal logic
* Clocked property checking
* Sequential verification
* State-dependent assertions

---

# Formal Property Coverage

The assertions verify:

* Matrix arithmetic correctness
* Proper register updates
* FSM output validity
* Stable output generation

These properties are checked exhaustively within the bounded verification depth.
