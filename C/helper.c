#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <ctype.h>

#include "common.h"

void AttrMap_print (AttrMap** am, int nb_attributes)
{
	for (int i = 0; i < nb_attributes; i++) {
		AttrMap * m = am[i];
		printf("Attribute: %s, Value: %s\n", m->name, m->value);
	}
}

void AttrMap_free (AttrMap** am, int nb_attributes)
{
	for (int i = 0; i < nb_attributes; i++) {
		AttrMap * m = am[i];
		free ((char *)(m->value));
		free (m);
	}
	free(am);
}

// https://gist.github.com/diabloneo/9619917#gistcomment-3364033
void timespec_diff(struct timespec *a, struct timespec *b, struct timespec *result) {
	result->tv_sec  = a->tv_sec  - b->tv_sec;
	result->tv_nsec = a->tv_nsec - b->tv_nsec;
	if (result->tv_nsec < 0) {
		--result->tv_sec;
		result->tv_nsec += 1000000000L;
	}
}

char** str_split(char* a_str, const char a_delim)
{
	char** result	= NULL;
	size_t count	 = 0;
	char* tmp		= a_str;
	char* last_delim = NULL;
	char delim[2];
	delim[0] = a_delim;
	delim[1] = 0;

	/* Count how many elements will be extracted. */
	while (*tmp)
	{
		if (a_delim == *tmp)
		{
			count++;
			last_delim = tmp;
		}
		tmp++;
	}

	/* Add space for trailing token. */
	count += last_delim < (a_str + strlen(a_str) - 1);

	/* Add space for terminating null string so caller
	   knows where the list of returned strings ends. */
	count++;

	result = malloc(sizeof(char*) * count);

	if (result)
	{
		size_t idx  = 0;
		char* token = strtok(a_str, delim);

		while (token)
		{
			assert(idx < count);
			*(result + idx++) = strdup(token);
			token = strtok(0, delim);
		}
		assert(idx == count - 1);
		*(result + idx) = NULL;
	}

	return result;
}

char* url_encode(const char* str)
{
	char* encoded = malloc(strlen(str) * 3 + 1);  // Maximum size
	if (!encoded) return NULL; // Check for allocation failure

	char* p = encoded;
	while (*str) {
		if (isalnum(*str) || *str == '-' || *str == '_' || *str == '.' || *str == '~') {
			*p++ = *str;  // Keep safe characters
		} else {
			sprintf(p, "%%%02X", (unsigned char)*str);  // Encode the character
			p += 3; // Move pointer forward by 3 (e.g., %20)
		}
		str++;
	}
	*p = '\0'; // Null-terminate the string
	return encoded; // Return the newly allocated string
}

void printWithSeparator(long long num, char separator)
{
	char buffer[50];
	int i = 0, count = 0;

	// Handle negative numbers
	if (num < 0) {
		putchar('-');
		num = -num;
	}

	// Convert number to string
	sprintf(buffer, "%lld", num);
	int length = strlen(buffer);

	// Print each digit and add separator as needed
	for (i = 0; i < length; i++) {
		putchar(buffer[i]);
		count++;
		// Add separator after every three digits except at the end
		if ((length - 1 - i) % 3 == 0 && i != length - 1) {
			putchar(separator);
		}
	}
}

void append_log (char * addr, char * message)
{
	if (addr == NULL)
	{
		return;
	}
	// Open the file in append mode ("a")
	FILE *file = fopen(addr, "a");
	if (file == NULL)
	{
		return;
	}
	fputs(message, file);
	fclose(file);
}

bool contains_character(const char *str, char ch)
{
	// Iterate through each character in the string
	while (*str) {
		if (*str == ch) {
			return true;  // Character found
		}
		str++;  // Move to the next character
	}
	return false;  // Character not found
}

char* doubleQuotes(const char* input)
{
	// Calculate the size of the new string
	int length = strlen(input);
	int newSize = 0;

	// Count the number of double quotes
	for (int i = 0; i < length; i++) {
		if (input[i] == '"') {
			newSize++;  // We will need an extra character for each double quote
		}
		newSize++;  // Count the current character
	}

	// Allocate memory for the new string
	char* output = (char*)malloc(newSize + 1);  // +1 for the null terminator
	if (output == NULL) {
		return NULL;  // Return NULL if memory allocation fails
	}

	int j = 0;  // Index for output
	for (int i = 0; i < length; i++) {
		if (input[i] == '"') {
			output[j++] = '"';  // Write first quote
			output[j++] = '"';  // Write the second quote
		} else {
			output[j++] = input[i];  // Copy the character as is
		}
	}
	output[j] = '\0';  // Null-terminate the new string

	return output;  // Return the new string
}
