#!/bin/sh

step.sh apply 0
kubectl exec $(pod_name.sh mongo) -it -- mongo sling-starter --eval "db.dropDatabase()"
sudo rm -rf /srv/data/default-sling-datastore-pvc-*/*

step.sh checkout 0
