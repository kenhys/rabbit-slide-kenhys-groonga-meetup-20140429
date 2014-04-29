#!/bin/bash

curl 'http://localhost:10041/d/column_remove?table=Company&name=full_name'
curl 'http://localhost:10041/d/column_create?table=Company&name=full_name&flags=COLUMN_SCALAR&type=ShortText'

#sudo -u groonga groonga /var/lib/groonga/db/db dump
curl 'http://localhost:10041/d/dump'

