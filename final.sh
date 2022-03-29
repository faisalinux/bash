#!/bin/bash
# Author: Faisal Khan
#Search Same name CSV and place it at one place then merge ti same name
dest=CONCAT
mkdir -p $dest
find "$@" -name "$dest" -prune -o -name '*.csv' |
while read file
do    base=$(basename "$file")
      if [ -s "$dest/$base" ]
      then sed '1d' <"$file"
      else cat "$file"
      fi >>"$dest/$base"
done
#replace the banned letters  \ , / , * , ? , : , [ , ]
cd $
for f in *; do 
mv "$f" `echo $f | tr ' ' '_'`; 
done
for f in *; do 
mv "$f" `echo $f | tr '[' '_'`; 
done
for f in *; do 
mv "$f" `echo $f | tr ']' '_'`; 
done
for f in *; do 
mv "$f" `echo $f | tr '\' '_'`; 
done
for f in *; do 
mv "$f" `echo $f | tr '/' '_'`; 
done
for f in *; do 
mv "$f" `echo $f | tr '*' '_'`; 
done
for f in *; do 
mv "$f" `echo $f | tr ';' '_'`; 
done
for f in *; do 
mv "$f" `echo $f | tr '.csv' '_'`; 
done
#expot csvs to xls
cd $dest
ssconvert --merge-to=result.xls *
