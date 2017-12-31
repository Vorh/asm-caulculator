#!/usr/bin/env bash



function compile(){
    nasm -f elf -F stabs $1 -o result.o >&2
    ld -m elf_i386 result.o -o ./result
    ./result

}


while getopts ":f:d" opt; do
    case $opt in
    f)
        compile $OPTARG
    ;;
    d)
        rm result
        rm result.o
    ;;
    \?)
    echo "Specify fail" -$OPTARG >&2
    ;;
    esac
done

