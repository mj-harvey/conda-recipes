#!/bin/sh

D="$SP_DIR/../../../"
mkdir -p $D/bin
mkdir -p $D/lib
mkdir -p $D/share


cp -r $HOME/psi4/bin/* $D/bin/
cp -r $HOME/psi4/lib/* $D/lib/
cp -r $HOME/psi4/share/* $D/share/

