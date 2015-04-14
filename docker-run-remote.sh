
SCRIPT_TO_RUN="docker-run.sh"

if [ "x$1" == "x" ] ; then
	echo "Usage: $0 <user>@<remote-host>"
	echo "Copies shell script to remote host and executes it, using ssh"
	exit 1
fi

REMOTE_HOST=$1

scp $SCRIPT_TO_RUN $REMOTE_HOST:.

ssh $REMOTE_HOST ./$SCRIPT_TO_RUN
