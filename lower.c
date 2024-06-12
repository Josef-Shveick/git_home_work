// low.c
#include <stdio.h>
#include "convert.h"

int main() {
    char input[100];
    
    printf("Enter text: ");
    fgets(input, sizeof(input), stdin);
    
    to_lowercase(input);
    
    printf("Lowercase: %s\n", input);
    
    return 0;
}
