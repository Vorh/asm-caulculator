#!/usr/bin/env bash

rm  dist/*

nasm -f elf src/hello_world.asm

ld -m elf_i386 src/hello_world.o -o ./dist/helloworld

dist/helloworld