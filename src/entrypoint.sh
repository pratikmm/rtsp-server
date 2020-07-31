# compile code
gcc -o stream  stream.c  `pkg-config --cflags --libs gstreamer-rtsp-server-1.0`

#setting variable for Video location
video_location="/src/earth.mp4"

# execute code
./stream "( filesrc location=$video_location ! qtdemux ! h264parse ! rtph264pay name=pay0 pt=96 )"