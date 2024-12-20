FROM gitpod/workspace-full

# Install yq for processing XML
RUN b=/usr/bin/yq; sudo sh -c "curl -L 'http://github.com/mikefarah/yq/releases/download/v4.44.6/yq_linux_amd64 -o $b && chmod +x $b"
