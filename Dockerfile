FROM n8nio/n8n:latest

USER root

# 1. Install the GitHub MCP Server (Global)
# We keep this! This is the tool we need to run.
RUN npm install -g @modelcontextprotocol/server-github

# 2. (REMOVED) The crash-causing community node lines
# We are removing the manual install of "n8n-nodes-mcp" 
# to stop the crash.

USER node