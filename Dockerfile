FROM postgres:13.2
ENV PG_MAJOR_VERSION=13
ENV POSTGRES_USER=${POSTGRES_USER}
ENV POSTGRES_PASSWORD=${POSTGRES_PASSWORD}
ARG runtimeDependencies="libc++1"
RUN apt-get update \
  && apt-get install -y --no-install-recommends ${runtimeDependencies}
COPY ./pkglibdir /usr/lib/postgresql/${PG_MAJOR_VERSION}/lib
COPY ./extension /usr/share/postgresql/${PG_MAJOR_VERSION}/extension
