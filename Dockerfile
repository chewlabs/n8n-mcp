# Dockerfile
FROM n8nio/n8n:latest
USER root
# Pre-install the MCP server so the workflow works immediately
RUN npm install -g @modelcontextprotocol/server-github
USER node