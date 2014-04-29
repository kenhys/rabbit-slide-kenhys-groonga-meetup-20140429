#!/bin/bash

curl 'http://localhost:10041/d/table_remove?name=Company'
curl 'http://localhost:10041/d/table_create?name=Company&type=TABLE_PAT_KEY&key_type=UInt32'

#curl 'http://localhost:10041/d/table_create?name=Company&type=TABLE_PAT_KEY&key_type=UInt32&default_tokenizer=TokenTrigram&normalizer=NormalizerNFKC51'

#curl 'http://localhost:10041/d/table_create?name=Company&type=TABLE_PAT_KEY&key_type=UInt32&default_tokenizer=TokenTrigram&normalizer=NormalizerMySQLGeneralCI'

curl 'http://localhost:10041/d/dump?name=Company'
#sudo -u groonga groonga /var/lib/groonga/db/db dump

