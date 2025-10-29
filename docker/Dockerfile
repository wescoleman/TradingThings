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
# Set prompt to show username (in blue) and current directory for interactive shells
# Place prompt in /etc/profile.d for login shells, and ensure interactive (non-login)
# shells source it by appending a small wrapper to /etc/bash.bashrc and /etc/skel/.bashrc
RUN printf '%s\n' 'if [ -n "${PS1:-}" ]; then' '  export PS1="\\[\\e[34m\\]\\u\\[\\e[0m\\]:\\w$ "' 'fi' \
    > /etc/profile.d/short_prompt.sh \
    && chmod 644 /etc/profile.d/short_prompt.sh \
    && printf '%s\n' 'if [ -n "${PS1:-}" ]; then . /etc/profile.d/short_prompt.sh; fi' >> /etc/bash.bashrc \
    && printf '%s\n' 'if [ -n "${PS1:-}" ]; then . /etc/profile.d/short_prompt.sh; fi' >> /etc/skel/.bashrc
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
