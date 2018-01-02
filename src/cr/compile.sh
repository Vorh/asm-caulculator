#!/usr/bin/env bash




for f in *.asm; do
    nasm -f elf -g -F dwarf $f
done


for f in *.o; do
    list="$list $f "
done



ld -m elf_i386 $list -o test

./test



while getopts ":d" opt; do
    case $opt in
    d)
      rm $list
      rm ./test

    ;;
    \?)
    echo "Specify fail" -$OPTARG >&2
    ;;
    esac
done


