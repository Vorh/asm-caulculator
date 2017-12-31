

for f in *.asm; do
    nasm -f elf $f
done


for f in *.o; do
    list="$list $f "
done



ld -m elf_i386 $list -o test



./test

