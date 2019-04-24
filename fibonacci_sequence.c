#include <stdio.h>
int main() {
    int i;
    int n;
    int term1 = 0;
    int term2 = 1;
    int sum;
    
    printf("Enter the number of terms: ");
    scanf("%d", &n);
    
    printf("%d", term1);
    printf("\n");

    for (i = 1; i <= n; ++i)
    {
        printf("%d  ", term2);
        printf("\n");
        sum = term1 + term2;
        term1 = term2;
        term2 = sum;
    }
    return 0;
}
	









