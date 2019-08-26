#!/bin/sh

action=$1

step_c=$2
let "step_p = $step_c - 1"

tag_c="$(git tag | grep 1.0-demo-$(printf "%03d" $step_c))"
tag_p="$(git tag | grep 1.0-demo-$(printf "%03d" $step_p))"

if [ -z "$tag_c" ]; then
    echo "No current tag for step $1";
    exit 1;
fi

case "$action" in
    show)
        if [ -z "$tag_p" ]; then
            echo "No previous tag for step 1";
            exit 1;
        fi

        git diff ${tag_p}...${tag_c}
        ;;

    apply)
        set -x
        git show ${tag_c}:k8s/sling.yaml | kubectl apply -f -
        set +x
        ;;

    checkout)
        set -x
        git checkout ${tag_c}
        set +x
        ;;

    *)
        echo "Usage: $0 show|apply|checkout step"
        exit 1
        ;;
esac
