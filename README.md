# 03-linkers-lab
This is HW for "RISC-V toolchain" course.

## Task 3.1

1.
```bash
file main.o
main.o: ELF 64-bit LSB relocatable, x86-64, version 1 (SYSV), not stripped

```

2.
```bash
readelf -S main.o
```
There are 14 sections.

4.
```bash
readelf -s main.o
```
We see "notype" for fact and print, because these symbols are undefined yet.

5.
Finally, in binary file "fact" all calls are resolved, displacements are filled.

## Task 2

Create my own static library for RISC-V and link to it.
```bash
make CC=${SC_GCC_PATH}/bin/riscv64-unknown-linux-gnu-gcc AR=${SC_GCC_PATH}/bin/riscv64-unknown-linux-gnu-ar QEMU_USER=${SC_QEMU_PATH}/qemu-riscv64 program_static_lib run-qemu -s
```
```bash
wc -c ./bin/program.elf 
8736 ./bin/program.elf
```

```bash
make clean
```

## Task 3
Create my own dynamic library for RISC-V and link to it.
```bash
make CC=${SC_GCC_PATH}/bin/riscv64-unknown-linux-gnu-gcc QEMU_USER=${SC_QEMU_PATH}/qemu-riscv64 program_dynamic_lib run-qemu -s
```
I noticed that executable file linked with dynamic library is smaller in size.
```bash
wc -c ./bin/program.elf 
8520 ./bin/program.elf
```

```bash
make clean
```

