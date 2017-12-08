#!/usr/bin/env bash


nasm -f elf -F stabs ./hello_world.asm

ld -m elf_i386 hello_world.o -o ./helloworld

./helloworld