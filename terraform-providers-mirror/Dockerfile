FROM ubuntu:24.04 AS downloader

WORKDIR /app

ARG DATABRICKS_CLI_VERSION=0.296.0
ARG KUBECTL_VERSION=1.35.3
ARG HELM_VERISON=4.1.4
ARG TERRAFORM_VERSION=1.14.8

RUN apt update && apt install -y curl unzip

RUN mkdir -p bin

RUN curl -LO https://github.com/databricks/cli/releases/download/v${DATABRICKS_CLI_VERSION}/databricks_cli_${DATABRICKS_CLI_VERSION}_linux_amd64.zip && \
    unzip databricks_cli_${DATABRICKS_CLI_VERSION}_linux_amd64.zip && \
    chmod a+x databricks && \
    mv databricks bin/databricks && \
    ./bin/databricks --version

RUN curl -LO "https://dl.k8s.io/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl" && \
    chmod a+x kubectl && \
    mv kubectl bin/kubectl && \
    ./bin/kubectl version --client

RUN curl -LO https://get.helm.sh/helm-v${HELM_VERISON}-linux-amd64.tar.gz && \
    tar -zxvf helm-v${HELM_VERISON}-linux-amd64.tar.gz && \
    chmod a+x linux-amd64/helm && \
    mv linux-amd64/helm bin/helm && \
    ./bin/helm version

RUN curl -LO https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    chmod a+x terraform && \
    mv terraform bin/terraform && \
    ./bin/terraform version


FROM hashicorp/terraform:1.14.8 AS terraform-providers-mirror

WORKDIR /app

COPY . .

RUN terraform providers mirror -platform=linux_amd64 /app/terraform-providers-mirror

RUN ls -alhR /app/terraform-providers-mirror


FROM alpine:3.23

WORKDIR /app

COPY --from=downloader /app/bin /app/bin
COPY --from=terraform-providers-mirror /app/providers.tf /app/providers.tf
COPY --from=terraform-providers-mirror /app/terraform-providers-mirror /app/terraform-providers-mirror
