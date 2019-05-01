#!/bin/bash

ENV=ssh
IP=$(curl ifconfig.me)

# Creates route 53 records based on env name

aws route53 change-resource-record-sets --hosted-zone-id Z33R1SMVNSBXAL --change-batch '{ "Comment": "Testing creating a record set", 
"Changes": [ { "Action": "UPSERT", "ResourceRecordSet": { "Name": 
"'"$ENV"'.ethanp.dev", "Type": "A", "TTL": 
600, "ResourceRecords": [ { "Value": "'"$IP"'" } ] } } ] }'
