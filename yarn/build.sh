#!/bin/sh
set -o errexit

rm -rf web/elm/elm-stuff
yarn install
yarn $1
