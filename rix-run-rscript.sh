#!/usr/bin/env nix-shell
#! nix-shell -i bash --pure ${1}
Rscript  \
  --no-site-file \
  --no-environ \
  --no-restore \
  ${2}