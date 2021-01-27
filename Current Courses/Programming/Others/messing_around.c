#include <stdio.h>

void remove_return(char *);

int main(int argc, char const *argv[])
{
	char buffer[4096];
	printf("%lu\n", sizeof(buffer));
	printf("Enter some text:\n");
	fgets(buffer, (sizeof buffer / sizeof buffer[0]), stdin);
	printf("Text you entered:\n");
	puts(buffer);
	remove_return(buffer);
	printf("Text you entered:\n");
	puts(buffer);
	printf("%lu\n", sizeof(buffer));
	return 0;
}

void remove_return(char *src)
{
	if (src == NULL)
		return;
	char *dest = src;
	while (*src)
	{
		if (*src != '\n')
			*dest++ = *src;
		src++;
	}
	*dest = '\0';
}