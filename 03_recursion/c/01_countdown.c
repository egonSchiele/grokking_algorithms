#include <stdio.h>

void countdown(int i) {
	printf("%d\n", i);
	
	// base case
	if (i <= 0)
		return;
	//recursive case
	else
		countdown(i - 1);
}

int main(void) {

	countdown(5);
	
	return 0;
}