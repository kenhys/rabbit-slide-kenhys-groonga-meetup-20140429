#!/bin/bash

EXAMPLE_DIR=`dirname $(dirname $(readlink -e $0))`

groonga $EXAMPLE_DIR/testdb/db < delete-by-key.grn

