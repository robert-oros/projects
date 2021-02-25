exit_after_sleep()
{
	sleep 10
	exit 0
}

trap 'echo "sigquit ignor" & exit_after_sleep ' QUIT
trap 'echo "sigint" & exit_after_sleep' INT

echo "test script started. My PID is $$"
while true ; do
	sleep 10
done