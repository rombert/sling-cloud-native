#!/bin/sh

git describe
if [ $? -ne 0 ]; then
    echo "Unable to describe HEAD, probably tags are not ancestors. Run ./scripts/retag.sh" ; 
    echo $out
    exit 1;
fi

current_head=$(git rev-parse --abbrev-ref HEAD)
for tag in $(git tag); do
    git checkout $tag
    mvn clean install dockerfile:push
done

git checkout $current_head
