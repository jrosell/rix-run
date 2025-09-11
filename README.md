<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)

<!-- badges: end -->

# rix-run

Command line tool to run R scripts that are annotated with rix roxygen2 tags.

## Supported tags

* @rix date
* @rix r_ver
* @rix r_pkgs
* @rix system_pkgs
* @rix git_pkgs

These annotations will be used in [{rix}](https://github.com/ropensci/rix) to generate the nix configuration of the environment that will run the R script in a docker container.

For instance, if we have:

```
print(here::here("."))
```

We can add:

```
#' @rix date = "2025-09-01"
#' @rix r_pkgs = c("here")
print(here::here("."))
```

## Installation

1. [Install Docker](https://docs.docker.com/get-started/get-docker/)
2. Dowload and extract or clone [the rix-run file](https://github.com/jrosell/rix-run) and put the exacutable in in your PATH. For example: 

```
$ git clone git@github.com:jrosell/rix-run.git
$ cd rix-run
$ echo "export PATH=PATH:~/.local/bin/" >> ~/.bashrc
$ chmod u+x rix-run
$ cp rix-run ~/.local/bin/rix-run

```

3. Open a terminal and use rix-run to run your R scripts.

## Usage

### Basic usage

The [examples/data-visualize.R](examples/data-visualize.R) file include date and r_pkgs annotated values.


Once `rix-run` is installed, to run the script execute:

```
$ rix-run examples/data-visualize.R
```

### Targets


The [examples/targets-run1.R](examples/targets-run1.R) file is a _targets.R script file that will be executed with tar_make when using the --targets argument.

Once `rix-run` is installed, to run the script execute:

```
$ rix-run examples/targets-run1.R --targets
```

### Quarto

The [examples/quarto-render.qmd](examples/quarto-render.qmd) file is quarto file that will be rendered when using the --quarto argument.

Once `rix-run` is installed, to run the script execute:

```
$ rix-run examples/quarto-render.qmd --quarto
```


## Feedback & troubleshooting

* You will find execution logs in the rix-run-logs folder.
* It's tested on Ubuntu. If you want to help, please test other systems.
* Please, open an issue if you have any problem or suggestion
* Feel free to open a PR to improve `rix-run`.


