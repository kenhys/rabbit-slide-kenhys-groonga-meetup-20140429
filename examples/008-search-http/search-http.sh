#!/bin/bash

curl "http://localhost:10041/d/table_remove?name=LexiconBigram"
curl "http://localhost:10041/d/table_create?name=LexiconBigram&type=TABLE_PAT_KEY&key_type=ShortText&default_tokenizer=TokenBigram"
curl "http://localhost:10041/d/column_create?table=LexiconBigram&name=company_name&flags=COLUMN_INDEX&type=Company&source=name"

curl "http://localhost:10041/d/select?table=Company&match_columns=name&query=京王"

#curl 'http://localhost:10041/d/dump?table=LexiconBigram'
#sudo -u groonga groonga /var/lib/groonga/db/db dump

