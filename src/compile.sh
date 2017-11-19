#!/usr/bin/env bash


nasm -f elf hello_world.asm

ld -m elf_i386 hello_world.o -o ../dist/helloworld

../dist/helloworld