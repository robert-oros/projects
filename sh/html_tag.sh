#!/bin/bash

tmp=file
get_html(){
  curl -A "Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/81.0" https://www.google.com/search?q=branza > $tmp
}

add_newline(){
  sed -i 's/<div class="g">/\n/g' $tmp
}
#get_title(){}
#get_link(){}
#get_line(){}

get_html
add_newline