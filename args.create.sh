#!/bin/sh
# 1436797ee4739c98201abc63728b725b
# uwe.schimon@mailpost.de 20211114 1201 02 05 09
# arg-function generator, depend of $usage

FILE="args.sh"
USAGE=`cat "args.usage"`

echo "#!/bin/sh
# uwe.schimon@mailpost.de autogenerated script to manage arguments from commandline
#set -x

args() {
USAGE=\"Usage: \$0 $USAGE\"
if [ -z \"\$1\" ]; then echo \$USAGE;
else
 for arg in \"\$@\"; do
  case \$arg in
        -#) A=true; shift;;
        -:) A=\"\"; shift;;" > $FILE
for i in $USAGE; do echo $i | sed -E "s/[^a-zA-Z_\|]//g" | awk -F'|' '{print "\t-" $1 "=*|--" $2 "=*)\t" toupper($1) "=\"\044\173arg#*=\175\";\t" toupper($2) "=\"\044" toupper($1) "\";\tif [ $A ]; then echo " toupper($2) "=" toupper($1) "=\"\044" toupper($1) "\"; fi;  shift ;;"}' >> $FILE; done
echo "  esac
 done
fi
}">>$FILE
chmod +x $FILE
