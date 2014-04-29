#!/bin/bash

TABLE_URL="http://localhost:10041/d/table_create?name=Company"

COLUMN_URL="http://localhost:10041/d/column_create?table=Company"

curl "http://localhost:10041/d/table_remove?name=Company"

curl "${TABLE_URL}&type=TABLE_PAT_KEY&key_type=UInt32"
curl "${COLUMN_URL}&name=name&flags=COLUMN_SCALAR&type=ShortText"
curl "${COLUMN_URL}&name=romaji&flags=COLUMN_SCALAR&type=ShortText"
curl "${COLUMN_URL}&name=hiragana&flags=COLUMN_SCALAR&type=ShortText"
curl "${COLUMN_URL}&name=katakana&flags=COLUMN_SCALAR&type=ShortText"
curl "${COLUMN_URL}&name=full_name&flags=COLUMN_SCALAR&type=ShortText"
curl "${COLUMN_URL}&name=short_name&flags=COLUMN_SCALAR&type=ShortText"
curl "${COLUMN_URL}&name=type&flags=COLUMN_SCALAR&type=UInt32"
curl "${COLUMN_URL}&name=status&flags=COLUMN_SCALAR&type=UInt32"
curl "${COLUMN_URL}&name=sort&flags=COLUMN_SCALAR&type=UInt32"

#VERBOSE="--verbose"
curl -X POST 'http://localhost:10041/d/load?table=Company' $VERBOSE -H 'Content-Type: application/json' -d @ekidata-company.grn

#curl 'http://localhost:10041/d/dump?name=Company'
#sudo -u groonga groonga /var/lib/groonga/db/db dump

