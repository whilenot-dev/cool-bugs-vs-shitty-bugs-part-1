#!/bin/bash

DIR=$( dirname "$( realpath "$0" )" )

python -m http.server --directory "${DIR}" 8000
