#!/bin/sh

kubectl get pods -l=app=sling "$@"
