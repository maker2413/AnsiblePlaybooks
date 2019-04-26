#!/bin/bash

ENV=ssh
IP=$(curl ifconfig.me)
ZONE=Z33R1SMVNSBXAL

# Creates route 53 records based on env name

aws route53 change-resource-record-sets --hosted-zone-id "$Zone" --change-batch '{ "Comment": "Testing creating a record set", 
"Changes": [ { "Action": "UPSERT", "ResourceRecordSet": { "Name": 
"'"$ENV"'.ethanp.dev", "Type": "A", "TTL": 
600, "ResourceRecords": [ { "Value": "'"$IP"'" } ] } } ] }'
