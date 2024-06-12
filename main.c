#include <stdio.h>
#include "math_lib/inc/math_lib.h"

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
        scanf("%d", &choice);

        switch (choice) {
            case 1:
                printf("Enter two numbers, divided by space: ");
                scanf("%lf %lf", &num1, &num2);
                printf("Sum: %.2lf\n", add(num1, num2));
                break;
            case 2:
                printf("Enter two numbers, divided by space: ");
                scanf("%lf %lf", &num1, &num2);
                printf("Difference: %.2lf\n", subtract(num1, num2));
                break;
            case 3:
                printf("Enter two numbers, divided by space: ");
                scanf("%lf %lf", &num1, &num2);
                printf("Product: %.2lf\n", multiply(num1, num2));
                break;
            case 4:
                printf("Enter two numbers, divided by space: ");
                scanf("%lf %lf", &num1, &num2);
                if (num2 != 0) {
                    printf("Fraction: %.2lf\n", divide(num1, num2));
                } else {
                    printf("Error: Division by zero.\n");
                }
                break;
            case 5:
                printf("Enter an integer: ");
                scanf("%d", &intNum);
                if (intNum >= 0) {
                    printf("Factorial of %d: %.0lf\n", intNum, factorial(intNum));
                } else {
                    printf("Error: Factorial of a negative number is undefined.\n");
                }
                break;
            case 6:
                printf("Enter a number: ");
                scanf("%lf", &num1);
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
