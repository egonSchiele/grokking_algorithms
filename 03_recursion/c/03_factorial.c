#include <stdio.h>

int fact(int x) {
	if (x == 1)
		return 1;
	else
		return x * fact(x - 1);
}

int main(void) {
	
	printf("%d", fact(5));

	return 0;
}