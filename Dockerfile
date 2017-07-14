FROM alpine:3.6
MAINTAINER "Kosuke Ono <kosuke_ono@cybird.co.jp>"

USER root
ENV PATH $PATH:/usr/local/bin
ENV TERRAFORM_VER 0.9.11
ENV TERRAFORM_SUM 804d31cfa5fee5c2b1bff7816b64f0e26b1d766ac347c67091adccc2626e16f3
ENV TERRAFORM_ZIP terraform_${TERRAFORM_VER}_linux_amd64.zip

RUN apk add --update make openssl openssh-client ca-certificates && rm -rf /var/cache/apk/*
RUN set -ex \
    && wget https://releases.hashicorp.com/terraform/${TERRAFORM_VER}/${TERRAFORM_ZIP} -O /tmp/${TERRAFORM_ZIP} \
    && echo "${TERRAFORM_SUM}  /tmp/${TERRAFORM_ZIP}" | sha256sum -c - \
    && unzip /tmp/${TERRAFORM_ZIP} -d /usr/local/bin \
    && rm /tmp/${TERRAFORM_ZIP}

VOLUME ["/data"]
WORKDIR /data
ENTRYPOINT ["terraform"]

