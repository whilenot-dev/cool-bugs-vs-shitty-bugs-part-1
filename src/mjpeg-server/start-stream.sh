#!/bin/bash

BOUNDARY_GST_PREFIX="--" # the gstreamer plugin seems to have a prefix for the boundary
BOUNDARY="-ThisRandomString---"

# multipart header
echo "HTTP/1.0 200"
echo "Content-type: multipart/x-mixed-replace;boundary=${BOUNDARY_GST_PREFIX}${BOUNDARY}"
echo ""

# multipart body parts
gst-launch-1.0 -q \
    videotestsrc is-live=true pattern=ball motion=sweep ! \
    videorate rate=0.04 ! \
    video/x-raw,width=640,height=480,framerate=60/1 ! \
    jpegenc quality=5 ! \
    multipartmux boundary="${BOUNDARY}" ! \
    filesink append=true location=/dev/stdout # the fdsink plugin didn't provide the needed `append` property to include the echoed header
