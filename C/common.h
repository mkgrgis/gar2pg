#ifndef XML2CSV_HLP
#define XML2CSV_HLP

#include <libpq-fe.h>
#include <libxml/parser.h>
#include <stdbool.h>

// Разные дополнительные функции helper.c
typedef struct {
    const xmlChar *name;
    const xmlChar *value;
} AttrMap;
void AttrMap_print (AttrMap** am, int nb_attributes);
void AttrMap_free  (AttrMap** am, int nb_attributes);

void timespec_diff(struct timespec *a, struct timespec *b, struct timespec *result);

char** str_split(char* a_str, const char a_delim);
char* url_encode(const char* str);

void printWithSeparator(long long num, char separator);
void append_log (char * addr, char * message);

bool contains_character(const char *str, char ch);
char* doubleQuotes(const char* input);

// Работа с СУБД pg_in.c
#define PG_COPY_BUFFER_SIZE 65536  // 64KB буфер
typedef struct {
    struct {
        PGconn *conn;
        char buffer[PG_COPY_BUFFER_SIZE];
        size_t offset;
    } pgCopyStatus;
    char *currentPath;
    // Байтовый счётчик потока ввода
    size_t xml_position;
} SAX_Context;

int pg_cortage_copy_begin(PGconn *conn, const char *table_name);
int pg_cortage_copy_send_row(SAX_Context *state, const char *csv_row);
int pg_cortage_copy_end(SAX_Context *state);

extern size_t cortage_count;
extern size_t pg_position;
extern char  *log_file_addr;
extern char  *xml_file_address;

#endif // XML2CSV_ГАР
