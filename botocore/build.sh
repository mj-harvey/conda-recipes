mkdir -p "$SP_DIR"

SRC=botocore
FIRSTVER=""
for VER in 3.4 3.5; do
	DIR="$SP_DIR/../../python$VER/site-packages"
	mkdir -p $DIR
	if [ "$FIRSTVER" == "" ]; then
		cp -r $SRC "$DIR"
		FIRSTVER=$VER
	else
		ln -s ../../python$FIRSTVER/site-packages/$SRC "$DIR/$SRC"
	fi
done
