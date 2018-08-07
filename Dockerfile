FROM circleci/golang:1.10

ENV CLOUD_SDK_VERSION 210.0.0

RUN curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
    tar xzf google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
    rm google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
    sudo google-cloud-sdk/install.sh --usage-reporting=false --path-update=true --bash-completion=true --rc-path=/.bashrc && \
    google-cloud-sdk/bin/gcloud config set --installation component_manager/disable_update_check true && \
    sudo cp -r google-cloud-sdk /opt/google-cloud-sdk && \
    sudo /opt/google-cloud-sdk/bin/gcloud components install app-engine-go
