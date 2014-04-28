#!/bin/bash

EXAMPLE_DIR=`dirname $(dirname $(readlink -e $0))`
rm -fr $EXAMPLE_DIR/testdb
mkdir -p $EXAMPLE_DIR/testdb

groonga -n $EXAMPLE_DIR/testdb/db < load-schema.grn
groonga $EXAMPLE_DIR/testdb/db < load-array.grn

