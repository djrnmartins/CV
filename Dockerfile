# Use the official Node.js image as the base image
FROM node:18.14.2

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    libnss3 \
    libatk-bridge2.0-0 \
    libx11-xcb1 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxfixes3 \
    libxrandr2 \
    libgbm1 \
    libpango-1.0-0 \
    libasound2 \
    libpangocairo-1.0-0 \
    libatk1.0-0 \
    libcups2 \
    libdrm2 \
    libxss1 \
    libgdk-pixbuf2.0-0 \
    libgtk-3-0 \
    && rm -rf /var/lib/apt/lists/*

# Download and install Chromium manually
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    && apt-get update \
    && apt-get install -y ./google-chrome-stable_current_amd64.deb \
    && rm google-chrome-stable_current_amd64.deb

# Set the environment variable to skip Chromium download
ENV PUPPETEER_SKIP_DOWNLOAD=true
ENV RESUME_PUPPETEER_NO_SANDBOX=1

# Set the working directory
WORKDIR /usr/src/app

# Install resume-cli and jsonresume-theme-class globally
RUN npm install -g resume-cli
RUN npm update -g resume-cli

# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Expose port 3000 (if needed for other purposes)
EXPOSE 3000

# Command to keep the container running
CMD ["tail", "-f", "/dev/null"]
