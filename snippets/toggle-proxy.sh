#!/usr/bin/env bash

# Set proxy function
function set_proxy() {
    export http_proxy="http://localhost:7890"
    export https_proxy="http://localhost:7890"
    echo "Proxy set to $http_proxy"
}

# Unset proxy function
function unset_proxy() {
    unset http_proxy
    unset https_proxy
    echo "Proxy unset"
}
