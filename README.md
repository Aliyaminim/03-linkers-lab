# 03-linkers-lab

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
