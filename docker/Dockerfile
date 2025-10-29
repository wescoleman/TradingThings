# Minimal Ubuntu-based Dockerfile (uses the most recent stable Ubuntu)
FROM ubuntu:latest

# Prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive
# install full Ubuntu distribution
RUN apt-get update \
    && apt-get -y upgrade \
    && apt-get -y install \
        ubuntu-standard \
        ubuntu-minimal \
    && rm -rf /var/lib/apt/lists/*
# Create a non-root user for safer runtime behavior
# Use CONTAINER_USER env var if set, otherwise default to 'app_user'
ARG CONTAINER_USER
ENV USER=${CONTAINER_USER:-"dev"}
ARG UID=1000
RUN set -eux; \
    if id -u "${USER}" >/dev/null 2>&1; then \
        echo "User ${USER} already exists"; \
    else \
        if getent passwd "${UID}" >/dev/null 2>&1; then \
            useradd -m -s /bin/bash "${USER}"; \
        else \
            useradd -m -u "${UID}" -s /bin/bash "${USER}"; \
        fi; \
    fi; \
    echo "${USER} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/${USER} \
    && chmod 0440 /etc/sudoers.d/${USER}

WORKDIR /home/${USER}
USER ${USER}

# Default to an interactive shell
CMD ["/bin/bash"]
