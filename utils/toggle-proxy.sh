# Set proxy function
function set_proxy() {
    export http_proxy="http://your.proxy.server:port"
    export https_proxy="http://your.proxy.server:port"
    echo "Proxy set to $http_proxy"
}

# Unset proxy function
function unset_proxy() {
    unset http_proxy
    unset https_proxy
    echo "Proxy unset"
}
