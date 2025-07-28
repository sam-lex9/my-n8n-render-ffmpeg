# Start from an official n8n Docker image.
# IMPORTANT: Use a specific stable version for production.
# Check Docker Hub (https://hub.docker.com/r/n8nio/n8n/tags) for available tags.
# As of current date (July 2025), a very recent version might be something like 1.x.y.
# For example, if 1.37.2 was recent, you might pick 1.37.2 or look for the latest stable on Docker Hub.
FROM n8nio/n8n:1.103.2 # <-- REPLACE with your desired specific n8n version!

# Switch to root user to install system packages like FFmpeg.
USER root

# Install FFmpeg. n8n's official images are typically Alpine Linux-based,
# so 'apk' is the correct package manager.
RUN apk add --no-cache ffmpeg

# Switch back to the 'node' user that n8n runs as, for security.
# This ensures proper ownership for n8n's internal files and data,
# especially if you're not using a persistent database like PostgreSQL.
RUN chown -R node:node /home/node/.n8n
USER node

# The base n8n image already handles EXPOSE and CMD instructions,
# so we don't need to repeat them here unless you want to override.
# EXPOSE 5678
# CMD ["n8n", "start"]
