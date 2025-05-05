#!/bin/bash
set -e

# Register the runner with PeerTube
peertube-runner register \
  --url "$PEERTUBE_URL" \
  --registration-token "$PEERTUBE_TOKEN" \
  --runner-name "$RUNNER_NAME" \
  --runner-description "Cloud Run PeerTube Runner"

# Start the runner server
peertube-runner server \
  --enable-job vod-web-video-transcoding \
  --enable-job vod-hls-transcoding \
  --enable-job vod-audio-merge-transcoding
