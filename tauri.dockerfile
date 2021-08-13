FROM rust:1.53-buster
LABEL pxslip.tauri.authors="PX Slip <dev@pxslip.com>"
LABEL description="A base tauri image with the dependencies installed and tauri-bundler"

#Install deps
RUN apt update && apt install -y libwebkit2gtk-4.0-dev \
  build-essential \
  curl \
  wget \
  libssl-dev \
  libgtk-3-dev \
  squashfs-tools

RUN rustup component add rustfmt

RUN cargo install tauri-bundler