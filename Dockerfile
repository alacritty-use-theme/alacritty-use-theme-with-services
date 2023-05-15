FROM debian:stable-slim
# Install Packages
RUN apt-get update -y
RUN apt install -y redshift
COPY /app .
RUN bash /root/local/theme-switcher/get-sunrise-sunset.sh
