#' @rix date = "2025-09-01"
#' @rix r_pkgs = c("targets", "tarchetypes", "curl", "here", "visNetwork", "readr", "dplyr", "ggplot2", "rlang") 

if (!dir.exists(here::here('examples'))) dir.create(here::here('examples'))
file_path <- here::here('examples', 'targets-run1-plot.png')


get_data <- function(file) {
  read_csv(file, col_types = cols()) %>%
    filter(!is.na(Ozone))
}
fit_model <- function(data) {
  lm(Ozone ~ Temp, data) %>%
    coefficients()
}
plot_model <- function(model, data) {
  ggplot(data) +
    geom_point(aes(x = Temp, y = Ozone)) +
    geom_abline(intercept = model[1], slope = model[2])
}
save_image <- function(p) {
  ggsave(
    filename = file_path, plot = p, create.dir = TRUE
  )
}

library(targets)
tar_option_set(packages = c("readr", "dplyr", "ggplot2"))
rlang::list2(
  tarchetypes::tar_download(file, "https://raw.githubusercontent.com/wlandau/targets-four-minutes/refs/heads/main/data.csv", here::here("examples", "targets-run1-data.csv")),
  tar_target(data, get_data(file)),
  tar_target(model, fit_model(data)),
  tar_target(plot, plot_model(model, data)),
  tar_target(image, save_image(plot))
)
