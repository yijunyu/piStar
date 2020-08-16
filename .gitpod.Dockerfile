FROM gitpod/workspace-full
RUN apt-get -q update && \
    apt-get install -yq inotify-tools && \
    rm -rf /var/lib/apt/lists/*
