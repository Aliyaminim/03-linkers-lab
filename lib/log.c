#include "../include/log.h"

// Функция для записи сообщений в лог
void log_message(LogLevel level, const char *format, ...) {
    const char *level_string = "";
    switch (level) {
        case LOG_DEBUG:
            level_string = "DEBUG";
            break;
        case LOG_INFO:
            level_string = "INFO";
            break;
        case LOG_WARNING:
            level_string = "WARNING";
            break;
        case LOG_ERROR:
            level_string = "ERROR";
            break;
    }

    time_t rawtime;
    struct tm *timeinfo;
    time(&rawtime);
    timeinfo = localtime(&rawtime);

    char time_buffer[80];
    strftime(time_buffer, 80, "%Y-%m-%d %H:%M:%S", timeinfo);

    va_list args;
    va_start(args, format);
    printf("[%s] [%s] ", time_buffer, level_string);
    vprintf(format, args);
    printf("\n");
    va_end(args);
}
