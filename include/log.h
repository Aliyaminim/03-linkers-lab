#pragma once

#include <stdio.h>
#include <stdarg.h>
#include <time.h>

typedef enum {
    LOG_DEBUG,
    LOG_INFO,
    LOG_WARNING,
    LOG_ERROR
} LogLevel;

// Функция для записи сообщений в лог
void log_message(LogLevel level, const char *format, ...);

