#!/bin/bash

# Function to print usage
usage() {
    echo "Usage: $0 -t <tag> [-r <repo> -p <push>]"
    echo "  -t    Tag for the Docker images"
    exit 1
}

# Parse command line arguments
while getopts ":t:u:p:" opt; do
    case $opt in
    t) TAG="$OPTARG" ;;
    r) REPO="$OPTARG" ;;
    p) PUSH=true ;;
    *) usage ;;
    esac
done

# Check if the tag argument is provided
if [ -z "$TAG" ]; then
    usage
fi

# Check if the REPO argument is provided
if [ -z "$REPO" ]; then
    REPO="tvrsimhan27"
fi

# Array of image names
IMAGES=("spark-base" "spark-master" "spark-worker" "spark-submit")
REPO="tvrsimhan27"

# Function to build and push a Docker image
build_image() {
    local IMAGE_NAME=$1
    local FULL_IMAGE_NAME="$REPO/$IMAGE_NAME:$TAG"
    local FULL_IMAGE_NAME_LATEST="$REPO/$IMAGE_NAME:latest"

    echo "Building Docker image $FULL_IMAGE_NAME..."
    docker build -t $FULL_IMAGE_NAME_LATEST -t $FULL_IMAGE_NAME $IMAGE_NAME

    if [ $? -ne 0 ]; then
        echo "Docker build for $IMAGE_NAME failed"
        exit 1
    fi

    if $PUSH; then
      push_image $FULL_IMAGE_NAME
    fi

}

push_image(){
    local FULL_IMAGE_NAME=$1
    
    echo "Pushing Docker image $FULL_IMAGE_NAME..."
    docker push $FULL_IMAGE_NAME

    if [ $? -ne 0 ]; then
        echo "Docker push for $FULL_IMAGE_NAME failed"
        exit 1
    fi

    echo "Docker image $FULL_IMAGE_NAME pushed successfully"
}

# Loop through the images and build/push each one
for IMAGE in "${IMAGES[@]}"; do
    build_image $IMAGE
done

if ! $PUSH; then
    echo "Build completed. Images are not pushed because the push flag (-P) was not set."
fi
