#include <stdio.h>
#include <math.h>

// Function to calculate the sum of two numbers
double add(double a, double b) {
    return a + b;
}

// Function to calculate the difference of two numbers
double subtract(double a, double b) {
    return a - b;
}

// Function to calculate the product of two numbers
double multiply(double a, double b) {
    return a * b;
}

// Function to calculate the fraction of two numbers
double divide(double a, double b) {
    if (b != 0) {
        return a / b;
    } else {
        printf("Error: Division by zero!\n");
        return 0;
    }
}

// Function to calculate the factorial of a non-negative integer
double factorial(int n) {
    if (n == 0 || n == 1) {
        return 1;
    } else {
        return n * factorial(n - 1);
    }
}

// Function to calculate the square root of a positive number
double squareRoot(double x) {
    if (x >= 0) {
        return sqrt(x);
    } else {
        printf("Error: Cannot calculate square root of a negative number!\n");
        return 0;
    }
}
