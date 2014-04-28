#!/bin/bash

rm -fr testdb
mkdir -p testdb

groonga -n testdb/db < load-schema.grn
groonga testdb/db < load-key-value-pair.grn

