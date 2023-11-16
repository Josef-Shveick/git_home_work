#include "math_lib.h"

int multiply(int a, int b) {
    return a * b;
}

int divide(int a, int b) {
    if (b != 0) {
        return a / b;
    } else {
        // Handle division by zero error
        return 0;
    }
}