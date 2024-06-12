#include <stdio.h>
#include <stdlib.h> // Include this header for the exit() function
#include "math_lib/inc/math_lib.h"

void clearInputBuffer() {
    int c;
    while ((c = getchar()) != '\n' && c != EOF) { }
}

void printMenu() {
    printf("Choose an operation:\n");
    printf("1. Add\n");
    printf("2. Subtract\n");
    printf("3. Multiply\n");
    printf("4. Divide\n");
    printf("5. Factorial\n");
    printf("6. Square Root\n");
    printf("7. Exit\n");
    printf("Enter your choice: ");
}

int main() {
    int choice;
    double num1, num2;
    int intNum;
    
    while (1) {
        printMenu();
        if (scanf("%d", &choice) != 1) { // Check if scanf successfully read an integer
            printf("Invalid input. Please enter a number.\n");
            clearInputBuffer(); // Clear the input buffer to prevent infinite loop
            continue;
        }

        switch (choice) {
            case 1:
                printf("Enter two numbers, divided by space: ");
                if (scanf("%lf %lf", &num1, &num2) != 2) { // Check if scanf successfully read two doubles
                    printf("Invalid input. Please enter two numbers.\n");
                    clearInputBuffer();
                    break;
                }
                printf("Sum: %.2lf\n", add(num1, num2));
                break;
            case 2:
                printf("Enter two numbers, divided by space: ");
                if (scanf("%lf %lf", &num1, &num2) != 2) {
                    printf("Invalid input. Please enter two numbers.\n");
                    clearInputBuffer();
                    break;
                }
                printf("Difference: %.2lf\n", subtract(num1, num2));
                break;
            case 3:
                printf("Enter two numbers, divided by space: ");
                if (scanf("%lf %lf", &num1, &num2) != 2) {
                    printf("Invalid input. Please enter two numbers.\n");
                    clearInputBuffer();
                    break;
                }
                printf("Product: %.2lf\n", multiply(num1, num2));
                break;
            case 4:
                printf("Enter two numbers, divided by space: ");
                if (scanf("%lf %lf", &num1, &num2) != 2) {
                    printf("Invalid input. Please enter two numbers.\n");
                    clearInputBuffer();
                    break;
                }
                if (num2 != 0) {
                    printf("Fraction: %.2lf\n", divide(num1, num2));
                } else {
                    printf("Error: Division by zero.\n");
                }
                break;
            case 5:
                printf("Enter an integer: ");
                if (scanf("%d", &intNum) != 1) { // Check if scanf successfully read an integer
                    printf("Invalid input. Please enter an integer.\n");
                    clearInputBuffer();
                    break;
                }
                if (intNum >= 0) {
                    printf("Factorial of %d: %.0lf\n", intNum, factorial(intNum));
                } else {
                    printf("Error: Factorial of a negative number is undefined.\n");
                }
                break;
            case 6:
                printf("Enter a number: ");
                if (scanf("%lf", &num1) != 1) { // Check if scanf successfully read a double
                    printf("Invalid input. Please enter a number.\n");
                    clearInputBuffer();
                    break;
                }
                if (num1 >= 0) {
                    printf("Square root of %.2lf: %.2lf\n", num1, squareRoot(num1));
                } else {
                    printf("Error: Square root of a negative number is undefined.\n");
                }
                break;
            case 7:
                printf("Exiting...\n");
                return 0;
            default:
                printf("Invalid choice. Please try again.\n");
                break;
        }

        printf("\n");
    }

    return 0;
}
