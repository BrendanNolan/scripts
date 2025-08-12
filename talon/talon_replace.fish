#! /usr/bin/env bash

set -euo pipefail

mkdir -p ~/.talon/user && pushd ~/.talon/user && git clone https://github.com/BrendanNolan/community.git && git checkout brendan
