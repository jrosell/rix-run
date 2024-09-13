<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)

<!-- badges: end -->

# rix.run

Command line tool to run R scripts that are anotated with [rix](https://github.com/ropensci/rix) roxygen2 like tags.

## Supported tags

* @rix r_ver
* @rix r_pkgs
* @rix system_pkgs
* @rix git_pkgs

These annotations will be used in [{rix}](https://github.com/ropensci/rix) to generate the nix configuration of the environment that will run the R script.

## Installation

Clone this repo and put rix-run in your path.

```
$ git clone https://github.com/jrosell/rix.run
$ chmod u+x rix.run/rix-run
$ cp rix.run/rix-run ./somewhere/in/your/search/path
```

## Usage


The [examples/data-visualize.R](examples/data-visualize.R) file include r_ver and r_pkgs anotated values.


Once rix-run is installed, to run the script execute:

```
$ rix-run examples/data-visualize.R
```

## Troubleshooting

* It's tested on Ubuntu.
* Please, open an issue if you have any problem.
* Feel free to open a PR to improve it.