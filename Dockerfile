FROM python:3.6.4-slim

MAINTAINER Operations Center Support

ENV ERRBOT_DIR=/errbot

RUN mkdir -p $ERRBOT_DIR

WORKDIR $ERRBOT_DIR

VOLUME ["/errbot/data", "/errbot/plugins"]

RUN apt-get update \
 && apt-get install -y \
      git \
      libssl-dev \
      libffi-dev \
      python3.6 \
 && rm -rf /var/lib/apt/lists/*

COPY requirements.txt ./requirements.txt

RUN pip install \
      --no-cache-dir \
      --disable-pip-version-check \
      -r requirements.txt

CMD ["errbot"]
