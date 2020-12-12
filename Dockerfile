FROM debian:sid
MAINTAINER Matt Bentley <mbentley@mbentley.net>

RUN apt-get update &&\
  DEBIAN_FRONTEND=noninteractive apt-get install -y crudini &&\
  rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["crudini"]
CMD ["--help"]
