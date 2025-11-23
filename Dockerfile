FROM n8nio/n8n:latest

# Switch to root to install global packages
USER root

# Install the GitHub MCP Server globally
# This allows n8n to spawn it as a subprocess
RUN npm install -g @modelcontextprotocol/server-github

# Switch back to the n8n user for security
USER node