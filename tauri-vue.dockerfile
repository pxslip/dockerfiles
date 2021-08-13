FROM pxslip/tauri:latest

ARG DISPLAY
ENV DISPLAY ${DISPLAY:-"host.docker.internal:0.0"}

RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash - \
  && apt-get install -y nodejs
RUN npm install --global yarn
RUN yarn global add @vue/cli