FROM debian:stable-slim
# Install Packages
RUN apt-get update && apt-get install -y \
  redshift \
  && rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash admin
COPY --chown=admin /app/var /var

WORKDIR /home/admin
USER admin
COPY /app/home/ /home/admin/
RUN bash /home/admin/.local/night-and-day/runner.sh
