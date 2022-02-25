FROM alpine:3.15 AS installer

RUN buildDependencies="ca-certificates make git" \
  && apk add --update ${buildDependencies}
WORKDIR /usr/build
RUN git clone https://github.com/sibedge-llc/plv8-build.git \
  && cd plv8-build && git checkout pg13-3.0.0-alpine
RUN apk del ${buildDependencies}

FROM postgres:13.6-alpine
ARG PLV8_VERSION=3.0.0
ENV POSTGRES_USER=${POSTGRES_USER}
ENV POSTGRES_PASSWORD=${POSTGRES_PASSWORD}
RUN apk add --update libstdc++
COPY --from=installer /usr/build/plv8-build/extension/ /usr/local/share/postgresql/extension/
COPY --from=installer /usr/build/plv8-build/pkglibdir/plv8-${PLV8_VERSION}.so /usr/local/lib/postgresql/plv8-${PLV8_VERSION}.so
