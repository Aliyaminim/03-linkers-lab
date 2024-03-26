#include "./include/log.h"

int main() {
    log_message(LOG_DEBUG, "This is a debug message");
    log_message(LOG_INFO, "This is an info message");
    log_message(LOG_WARNING, "This is a warning message");
    log_message(LOG_ERROR, "This is an error message");

    return 0;
}