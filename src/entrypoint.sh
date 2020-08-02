# compile code
gcc -o stream  stream.c  `pkg-config --cflags --libs gstreamer-rtsp-server-1.0`

# execute code
./stream "( filesrc location=/src/sample-mp4-file.mp4 ! qtdemux ! h264parse ! rtph264pay name=pay0 pt=96 )"
