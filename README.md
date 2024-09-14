<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)

<!-- badges: end -->

# rix-run

Command line tool to run R scripts that are annotated with rix roxygen2 tags.

## Supported tags

* @rix r_ver
* @rix r_pkgs
* @rix system_pkgs
* @rix git_pkgs

These annotations will be used in [{rix}](https://github.com/ropensci/rix) to generate the nix configuration of the environment that will run the R script.

## Installation

Clone this repo and put `rix-run` in your path.

```
$ git clone git@github.com:jrosell/rix-run.git
$ chmod u+x rix-run/rix-run
$ cp rix-run/rix-run ./somewhere/in/your/search/path
```

## Usage


The [examples/data-visualize.R](examples/data-visualize.R) file include r_ver and r_pkgs annotated values.


Once `rix-run` is installed, to run the script execute:

```
$ rix-run examples/data-visualize.R
```

To use docker:

```
$ docker build -f Dockerfile -t rix-run-image . \
  && docker run --name rix-run-container --rm  -v $(pwd)/examples:/workspace/examples/:rw rix-run-image
```

To clean up the used docker images and containers:

```
(docker container rm -f rix-run-container || true) \
		&& (docker rmi $(docker images --format '{{.Repository}}:{{.ID}}'| egrep 'rix-run-image' | cut -d':' -f2 | uniq) --force || true)
```

## Troubleshooting

* It's tested on Ubuntu. If you want to help, please test Debian, Fedora, Centos, MacOS, etc. Windows it's not (yet?) supported.
* Please, open an issue if you have any problem.
* Feel free to open a PR to improve `rix-run`.


