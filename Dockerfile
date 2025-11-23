FROM n8nio/n8n:latest

USER root

# 1. Install dependencies globally
RUN npm install -g @modelcontextprotocol/server-github supergateway

# 2. Create a robust startup script with explicit IP binding (0.0.0.0)
RUN echo '#!/bin/sh' > /start.sh && \
    echo 'echo "Starting Supergateway..."' >> /start.sh && \
    echo 'npx supergateway --port 8000 --host 0.0.0.0 --stdio "npx -y @modelcontextprotocol/server-github" &' >> /start.sh && \
    echo 'sleep 5' >> /start.sh && \
    echo 'echo "Starting n8n..."' >> /start.sh && \
    echo 'n8n start' >> /start.sh && \
    chmod +x /start.sh

USER node

ENTRYPOINT ["/bin/sh", "/start.sh"]