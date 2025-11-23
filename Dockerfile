FROM n8nio/n8n:latest

USER root

# 1. Install the GitHub MCP Server (Global)
# This is for the "Command" to run: npx @modelcontextprotocol/server-github
RUN npm install -g @modelcontextprotocol/server-github

# 2. Install the MCP Community Node (Local to n8n)
# We install it directly into the n8n nodes folder to bypass the GUI installer
RUN mkdir -p /home/node/.n8n/nodes && \
    cd /home/node/.n8n/nodes && \
    npm install n8n-nodes-mcp

# 3. Fix Permissions
# Ensure the 'node' user owns these new files
RUN chown -R node:node /home/node/.n8n

USER node