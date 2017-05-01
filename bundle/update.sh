#!/usr/bin/env bash
set -o errexit -o nounset -o pipefail -o errtrace -x
IFS=$'\n\t'
function recompile_cmdt()
{
    cd Command-T
    /usr/bin/rake make
    cd ..
}
function update_repos()
{
    for dir in $(ls -d */); do
        cd $dir
        git pull --rebase
        cd ..
    done
}
function main()
{
    update_repos
    recompile_cmdt
}
main
