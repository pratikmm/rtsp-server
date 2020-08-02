FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y --fix-missing \
    libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev wget git vim python3-pip libgstrtspserver-1.0-0 dos2unix \
    libgstreamer1.0-0 gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-doc gstreamer1.0-tools gstreamer1.0-x gstreamer1.0-alsa gstreamer1.0-pulseaudio libgstrtspserver-1.0-0

RUN apt install xz-utils

COPY src /src
WORKDIR /src

RUN dos2unix /src/* && chmod +x install_rtsp.sh && bash +x install_rtsp.sh

RUN wget https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4

ENTRYPOINT ["bash", "+x", "entrypoint.sh"]
