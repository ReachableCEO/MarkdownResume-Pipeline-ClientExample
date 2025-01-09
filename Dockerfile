# Use a base image with Pandoc and LaTeX
FROM pandoc/latex:latest

# Set working directory
WORKDIR /app

# Install additional dependencies
RUN apt-get update && \
    apt-get install -y \
    bash \
    git \
    && rm -rf /var/lib/apt/lists/*

# Copy the client script into the container
COPY build/build-pipeline-client-markdown.sh /app/

# Make the client script executable
RUN chmod +x /app/build-pipeline-client-markdown.sh

# Clone the necessary repositories for 'mo' utility and server script
RUN git clone https://git.knownelement.com/ExternalVendorCode/mo.git /app/vendor/mo && \
    git clone https://git.knownelement.com/reachableceo/MarkdownResume-Pipeline.git /app/vendor/MarkdownResume-Pipeline

# Set environment variables for script execution
ENV MO_PATH=/app/vendor/mo/mo
ENV PIPELINE_SERVER_SCRIPT=/app/vendor/MarkdownResume-Pipeline/build/build-pipeline-server-markdown.sh

# Set volumes for input and output
VOLUME ["/ResumeInput", "/ResumeOutput"]

# Set the default command to execute the client script
CMD ["/app/build-pipeline-client-markdown.sh"]
