FROM gliderlabs/alpine:3.4

# ARG VERSION
# ARG SHA256

ENV TERRAFORM_VERSION=0.7.0 \
    LOG_LEVEL=DEBUG

# Add packages without caching
RUN apk --no-cache add \
        bash \
        nodejs \
        curl

# Install terraform
RUN export \
        PACKAGE_NAME="terraform" \
        PACKAGE_VERSION=${TERRAFORM_VERSION} \
        PACKAGE_SHA256="a196c63b967967343f3ae9bb18ce324a18b27690e2d105e1f38c5a2d7c02038d" \
    && curl --retry 7 --fail -vo /tmp/${PACKAGE_NAME}.zip \
        "https://releases.hashicorp.com/${PACKAGE_NAME}/${PACKAGE_VERSION}/${PACKAGE_NAME}_${PACKAGE_VERSION}_linux_amd64.zip" \
    && echo "${PACKAGE_SHA256}  /tmp/${PACKAGE_NAME}.zip" | sha256sum -c \
    && unzip /tmp/${PACKAGE_NAME} -d /usr/local/bin \
    && rm /tmp/${PACKAGE_NAME}.zip

CMD ["/bin/bash"]

# https://releases.hashicorp.com/terraform/0.7.0/terraform_0.7.0_linux_amd64.zip

# Solaris: https://releases.hashicorp.com/terraform/0.7.0/terraform_0.7.0_solaris_amd64.zip

# https://releases.hashicorp.com/terraform/0.7.0/terraform_0.7.0_SHA256SUMS
# keybase id hashicorp


# This is the public key from above - one-time step.
# gpg --import hashicorp.asc

# Download the binary and signature files.
# curl -Os https://releases.hashicorp.com/vault/0.5.2/vault_0.5.2_linux_amd64.zip
# curl -Os https://releases.hashicorp.com/vault/0.5.2/vault_0.5.2_SHA256SUMS
# curl -Os https://releases.hashicorp.com/vault/0.5.2/vault_0.5.2_SHA256SUMS.sig

# Verify the signature file is untampered.
# gpg --verify vault_0.5.2_SHA256SUMS.sig vault_0.5.2_SHA256SUMS

# Verify the SHASUM matches the binary.
# shasum -a 256 -c vault_0.5.2_SHA256SUMS
