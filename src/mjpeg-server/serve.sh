#!/bin/bash

DIR=$( dirname "$( realpath "$0" )" )

nc -l -k -p 8001 -c "${DIR}/start-stream.sh"
