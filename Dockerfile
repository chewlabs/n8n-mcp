FROM n8nio/n8n:latest

USER root

# 1. Install the GitHub MCP Server globally
RUN npm install -g @modelcontextprotocol/server-github

# 2. Create the custom nodes directory
RUN mkdir -p /home/node/.n8n/custom/node_modules

# 3. Install the community node into that specific directory
WORKDIR /home/node/.n8n/custom
RUN npm install n8n-nodes-mcp

# 4. Set ownership back to the node user
RUN chown -R node:node /home/node/.n8n

USER node