#! /usr/bin/env fish

pushd ~/.talon
mkdir -p user
pushd user
git clone https://github.com/BrendanNolan/community.git
git checkout brendan
