#!/bin/bash
set -e

rm -f /product/tmp/pids/server.pid

exec "$@"
