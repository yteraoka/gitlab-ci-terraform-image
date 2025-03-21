FROM debian:12.10-slim

# pipefail を指定可能にする
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get update \
 && apt-get upgrade -y \
 && apt-get install -y --no-install-recommends curl git ca-certificates unzip \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && curl -Lo /tmp/awscliv2.zip https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip \
 && unzip /tmp/awscliv2.zip \
 && ./aws/install \
 && rm -fr ./aws /tmp/awscliv2.zip \
 && git clone --depth 1 https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.1 \
 && echo "source ~/.asdf/asdf.sh" >> ~/.bashrc \
 && source ~/.asdf/asdf.sh \
 && asdf plugin add terraform \
 && asdf install terraform latest \
 && curl -Lo /tmp/tfcmt-gitlab.tar.gz https://github.com/hirosassa/tfcmt-gitlab/releases/download/v0.1.4/tfcmt-gitlab_linux_amd64.tar.gz \
 && tar -C /usr/local/bin -xf /tmp/tfcmt-gitlab.tar.gz tfcmt-gitlab \
 && rm /tmp/tfcmt-gitlab.tar.gz \
 && curl -Lo /tmp/tflint_linux_amd64.zip https://github.com/terraform-linters/tflint/releases/download/v0.44.1/tflint_linux_amd64.zip \
 && unzip /tmp/tflint_linux_amd64.zip tflint -d /usr/bin \
 && chmod 0755 /usr/bin/tflint \
 && rm /tmp/tflint_linux_amd64.zip

ENTRYPOINT ["/bin/bash"]
