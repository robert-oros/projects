if ! type "$foobar_command_name" > /dev/null; then
  # install foobar here
fi

if testcmd hello; then
    echo 'hello is in the path'
else
    echo 'hello is not in the path'
fi

