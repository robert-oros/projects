#!/bin/bash

tmp=file.html

get_html(){
  curl -A "Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/81.0" https://www.google.com/search?q=branza > $tmp
}

add_newline(){
  # sed -i 's|<div class="hlcw0c">|\n|g' $tmp # sed -i 's|<div class="g">|\n|g' $tmp # sed -i 's|<div class="yuRUbf">|\n|g' $tmp
  sed -i 's|<div class="TbwUpd NJjxre">|\n|g' $tmp
  sed -i 's|<br>|\n|g' $tmp
}

get_line(){
  while read -r line; do
    get_title $line
    get_link $line
  done < $tmp
}

get_title(){
  sed -n 's:.*<h3 class="LC20lb DKV0Md">\(.*\)</h3>.*:\1:p' $@ > files
}

get_link(){
  echo $@
  sed -n 's/<a href=\([^>]*\).*/\1/' $@ > links
}

get_html
add_newline
get_line

