#!/bin/bash

EXAMPLE_DIR=`dirname $(readlink -e $0)`
rm -fr $EXAMPLE_DIR/testdb
mkdir -p $EXAMPLE_DIR/testdb
groonga -n $EXAMPLE_DIR/testdb/db < ekidata-schema.grn
groonga $EXAMPLE_DIR/testdb/db < ekidata-prefs.grn
groonga $EXAMPLE_DIR/testdb/db < ekidata-company.grn
groonga $EXAMPLE_DIR/testdb/db < ekidata-station.grn

