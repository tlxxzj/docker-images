FROM hashicorp/terraform:1.14

WORKDIR /app

COPY . .

RUN terraform providers mirror -platform=linux_amd64 /terraform-providers-mirror

