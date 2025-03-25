FROM --platform=linux/x86-64 node:22-alpine

ARG N8N_VERSION

RUN if [ -z "$N8N_VERSION" ] ; then echo "The N8N_VERSION argument is missing!" ; exit 1; fi

RUN apk add --update bash wget git tini && \
    npm install -g n8n@${N8N_VERSION} pnpm && \
    rm -rf /root /tmp/* /var/cache/apk/* && \
    mkdir /root

USER node

WORKDIR /home/node

EXPOSE 5678

COPY docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["tini", "--", "/docker-entrypoint.sh"]