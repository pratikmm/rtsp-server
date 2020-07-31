FROM ubuntu:16.04

COPY install /install

WORKDIR /install

RUN apt-get update && \
    apt-get install -y \
    libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev wget git vim python3-pip libgstrtspserver-1.0-0 \
    libgstreamer1.0-0 gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-doc gstreamer1.0-tools gstreamer1.0-x gstreamer1.0-alsa gstreamer1.0-pulseaudio libgstrtspserver-1.0-0

RUN chmod +x install_rtsp.sh && bash +x install_rtsp.sh

COPY src /src

WORKDIR /src

RUN wget -o earth.mp4 https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_1280_10MG.mp4
ENTRYPOINT ["bash", "+x", "entrypoint.sh"]
