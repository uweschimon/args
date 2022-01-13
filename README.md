# args
It is a normal procedure that the call of a program is connected with the passing of parameters.
args supports this work in a simple way.

The following is a small example:
==
A script collectimages.sh is supposed to collect JPG-images in a folder. It is to be called with ./collectimages.sh -f="$HOME".

 #!
 F=/home # default value
 TP="/tmp/$$"; mkdir -p $TP
 echo -n "[-f|--folder]=" > $TP/args.usage
 . cargs; cargs $TP; . $TP/args.sh; args $@;# rm -r $TP
 echo "JPG in folder: $FOLDER:"
 find $FOLDER -name "*.JPG"

cargs (in /usr/bin/local/cargs) creates, depending on args.usage the function args,
which is called in the script with args $@, and does the passing of the required arguments.
In the example the value is stored in $F or $FOLDER and can be used in the script.

the usage format knows the following variants
[-f|--folder]=
-f=/tmp
--folder=/tmp
if no values are passed, the default value set before calling args applies, in the example F=/home

[-l|--log]
is a switch. The variable $L and $LOG get the value 1

