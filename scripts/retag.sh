#!/bin/sh

for entry in $(git log --pretty='%H,%s' | grep 'Set up' | sed 's/Set up //'); do
    commit=$(echo $entry | cut -d ',' -f 1)
    tag=$(echo $entry | cut -d ',' -f 2)
    git tag -a -f -m "Tagged $tag" $tag $commit
done
