#!/bin/bash

curl 'http://localhost:10041/d/table_remove?name=Users'
curl 'http://localhost:10041/d/table_create?name=Users&type=TABLE_PAT_KEY&key_type=ShortText'
#curl 'http://localhost:10041/d/table_create?name=Users&type=TABLE_PAT_KEY&key_type=ShortText&default_tokenizer=TokenTrigram&normalizer=NormalizerNFKC51'
#curl 'http://localhost:10041/d/table_create?name=Users&type=TABLE_PAT_KEY&key_type=ShortText&default_tokenizer=TokenTrigram&normalizer=NormalizerMySQLGeneralCI'

sudo -u groonga groonga /var/lib/groonga/db/db dump

