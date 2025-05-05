FROM node:20-bookworm

# Install FFmpeg and FFprobe
RUN apt-get update && apt-get install -y ffmpeg && apt-get clean

# Set working directory
WORKDIR /app

# Install PeerTube runner
RUN npm install -g @peertube/peertube-runner

# Copy start script
COPY start-runner.sh /app/start-runner.sh
RUN chmod +x /app/start-runner.sh

# Expose port (not strictly necessary for Cloud Run, but good practice)
EXPOSE 8000

# Run the start script
CMD ["/app/start-runner.sh"]
