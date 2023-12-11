# Generic build
build flags="":
    cc *.c {{flags}} -o main

# Build with coverage
build-coverage:
    just build "--coverage"

# Test coverage
coverage: build-coverage
    ./main
    # GCC generates longer file names than Clang
    gcov main-main main-foo

# Generate coverage report
report: coverage
    lcov --capture --directory . --base-directory . --output-file coverage.info
    genhtml coverage.info --output-directory html

# Test coverage using Clang
coverage1: build-coverage
    ./main
    # Clang generates shorter files names than GCC
    llvm-cov gcov main foo

# Generate coverage report using Clang
report1: coverage1
    # Relative path in --gcov-tool causes issues
    lcov --gcov-tool "$(pwd)/llvm-gcov.sh" --capture --directory . --base-directory . --output-file coverage.info
    genhtml coverage.info --output-directory html

# Remove temporary files
clean:
    rm -rf main *.out *.gcov *.gcda *.gcno *.info html
