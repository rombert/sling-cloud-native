#!/bin/sh

export PS1='$(kube_ps1) $ '
export KUBECONFIG=~/.config/kube/homelab.yaml
export PATH=${PATH}:`pwd`/scripts

kubeon
