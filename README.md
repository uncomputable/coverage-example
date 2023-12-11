# Example for testing code coverage [GCC, Clang]

A minimal, reproducible example for testing code coverage of C code using GCC or Clang.

## Set up GCC

Use nix for an automatic setup.

```bash
nix develop
```

Otherwise, install `gcc`, `just` and `lcov`.

## Test coverage using GCC

Run the `report` target to generate an HTML coverage report.

```bash
just report
```

Take a look at the justfile to see the individual steps.

## Set up Clang

Use nix for an automatic setup.

```bash
nix develop .#clang
```

Otherwise, install `clang`, `just`, `lcov` and `llvm`.

## Test coverage using Clang

Run the `report1` target to generate an HTML coverage report.

```bash
just report1
```

Take a look at the justfile to see the individual steps.
