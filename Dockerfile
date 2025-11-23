FROM n8nio/n8n:latest

USER root

# 1. Install GitHub MCP Server
RUN npm install -g @modelcontextprotocol/server-github

# 2. Install Supergateway (The Bridge)
# This tool converts the "Stdio" server into an "HTTP" server
RUN npm install -g supergateway

# 3. Clean up any broken community nodes
RUN rm -rf /home/node/.n8n/custom

USER node