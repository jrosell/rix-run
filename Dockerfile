FROM ubuntu:latest

WORKDIR /workspace

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    curl ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install linux \
  --extra-conf "sandbox = false" \
  --init none \
  --no-confirm

ENV PATH="${PATH}:/nix/var/nix/profiles/default/bin"


COPY rix-run inst/extdata/.Rprofile examples/data-visualize.R /workspace/

CMD /workspace/rix-run examples/data-visualize.R

