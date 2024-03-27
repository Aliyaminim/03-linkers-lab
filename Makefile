CC ?= gcc
CFLAGS ?= -O0
QEMU_USER ?= qemu-x86_64
AR ?= ar
LIB_DIR := ./lib
BIN_DIR := ./bin

.PHONY: clean _bin_dir _lib_dir

_bin_dir:
	@mkdir -p ${BIN_DIR}

_lib_dir:
	@mkdir -p ${LIB_DIR}

clean:
	rm -rf *.o ${BIN_DIR} ${LIB_DIR}

static_lib: _bin_dir _lib_dir ./src/log.c
	${CC} ${CFLAGS} ./src/log.c -c -o ${BIN_DIR}/log.o
	${AR} -cr ${LIB_DIR}/liblog.a ${BIN_DIR}/log.o

program_static_lib: static_lib main.c
	${CC} ${CFLAGS} main.c -L./lib -llog -o ${BIN_DIR}/program.elf

dynamic_lib: _bin_dir _lib_dir ./src/log.c
	${CC} ${CFLAGS} -fPIC ./src/log.c -c -o ${BIN_DIR}/log.o
	${CC} -shared ${BIN_DIR}/log.o -o ${LIB_DIR}/liblog.so

program_dynamic_lib: dynamic_lib main.c
	${CC} main.c -L./lib -llog -Wl,-rpath,./lib -o ${BIN_DIR}/program.elf

run-qemu: ${BIN_DIR}/program.elf
	${QEMU_USER} -L ./lib -L /opt/sc-dt/riscv-gcc/sysroot/ ${BIN_DIR}/program.elf