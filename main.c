#include <stdio.h>
#include "math_lib/inc/math_lib.h"

int main() {
    double num1 = 10.5;
    double num2 = 5.2;

    printf("Sum: %.2lf\n", add(num1, num2));
    printf("Difference: %.2lf\n", subtract(num1, num2));
    printf("Product: %.2lf\n", multiply(num1, num2));
    printf("Fraction: %.2lf\n", divide(num1, num2));
    printf("Factorial of 5: %.0lf\n", factorial(5));
    printf("Square root of %.2lf: %.2lf\n", num1, squareRoot(num1));

    return 0;
}
