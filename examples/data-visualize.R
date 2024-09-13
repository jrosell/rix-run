#' @rix r_ver = '4.3.3'
#' @rix r_pkgs = c('here','ggplot2', 'dplyr', 'tidyr', 'palmerpenguins', 'ggthemes', 'R.devices')
library(here)
library(dplyr)
library(tidyr)
library(ggplot2)
library(palmerpenguins)
library(ggthemes)
library(R.devices)

file_path <- here('examples', 'data-visualize-penguin-plot.png')

str(penguins)
p <- penguins |> 
  drop_na() |> 
  ggplot(aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point()

suppressGraphics(ggsave(filename = file_path, plot = p))
if (interactive()) {
  utils::browseURL(file_path)
}