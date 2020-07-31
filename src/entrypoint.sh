gcc -o stream  stream.c  `pkg-config --cflags --libs gstreamer-rtsp-server-1.0`

python3 fetch_video.py


video_location="/src/earth.mp4"
./stream "( filesrc location=$video_location ! qtdemux ! h264parse ! rtph264pay name=pay0 pt=96 )"