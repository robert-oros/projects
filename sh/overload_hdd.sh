# > is used to overwrite a file and >> is used to append to a file.
#!/bin/bash

txt="asdfasdjfkasdjflskdjfasdf";

while true; do
  echo $txt$txt >> file
done
