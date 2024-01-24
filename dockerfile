# Use the base image 'ubuntu:bionic'
FROM --platform=linux/amd64 ubuntu:bionic
# Update the package repository
# Install necessary packages
RUN apt-get update && \
    apt-get install -y \
        ca-certificates \
        wget && \
    update-ca-certificates
# Define the Hugo version
ARG HUGO_VERSION="0.117.0"
# Download and install Hugo
RUN wget --quiet "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz" && \
    tar xzf hugo_${HUGO_VERSION}_Linux-64bit.tar.gz && \
    rm -r hugo_${HUGO_VERSION}_Linux-64bit.tar.gz && \
    mv hugo /usr/bin && \
    chmod 755 /usr/bin/hugo
## Hugo source code
# Set the working directory to '/src'
WORKDIR /src
# Copy code into the '/src' directory
COPY ./ /src
# Command to run when the container starts
CMD ["hugo", "server", "--bind", "0.0.0.0"]