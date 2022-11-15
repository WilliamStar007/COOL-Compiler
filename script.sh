#!bin/bash
#!/usr/bin/env python@3.10.5

mkdir -p ./type
mkdir -p ./x86
mkdir -p ./gen

chmod +x ./tests/*.cl

for f in ./tests/*.cl;
do
   ./cool.exe --out ./type/$(basename $f .cl) --type $f
   ./cool.exe --out ./x86/$(basename $f .cl) --x86 $f
done

for f in ./type/*cl-type;
do
    python3 ./src/main.py $f
    mv ./type/$(basename $f .cl-type).s ./gen
done

diff -qr ./gen ./x86
