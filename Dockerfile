FROM node:10.16.2-alpine

WORKDIR /app/

# Generic
COPY app /app/

# Node
ENV PATH "$PATH:/app/node_modules/.bin/"
RUN yarn install --frozen-lockfile && yarn cache clean
ENV NODE_PATH=/app/node_modules/

WORKDIR /code/

# Build arguments
ARG BUILD_DATE
ARG BUILD_REF

# Labels
LABEL \
    maintainer="Robbert Müller <spam.me@grols.ch>" \
    org.label-schema.description="Remark-lint in a container for gitlab-ci" \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.name="Remark-lint" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.url="https://pipeline-components.gitlab.io/" \
    org.label-schema.usage="https://gitlab.com/pipeline-components/remark-lint/blob/master/README.md" \
    org.label-schema.vcs-ref=${BUILD_REF} \
    org.label-schema.vcs-url="https://gitlab.com/pipeline-components/remark-lint/" \
    org.label-schema.vendor="Pipeline Components"
