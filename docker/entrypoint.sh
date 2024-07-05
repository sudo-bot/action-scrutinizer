#!/bin/sh -l

##
# @license http://unlicense.org/UNLICENSE The UNLICENSE
# @author William Desportes <williamdes@wdes.fr>
##

set -eu

CLI_ARGS="$1"

echo "::debug CLI_ARGS: ${CLI_ARGS}"

git config --global --add safe.directory $PWD

ocular code-coverage:upload ${CLI_ARGS}
