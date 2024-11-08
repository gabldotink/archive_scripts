#!/bin/sh
set -x
export POSIXLY_CORRECT
compsize -x "$@"
