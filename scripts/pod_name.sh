#!/bin/sh

kubectl get pods -l="app=${1}" --output=jsonpath={.items..metadata.name}
