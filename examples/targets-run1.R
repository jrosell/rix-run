#' @rix r_ver = "4.3.3"
#' @rix r_pkgs = c("targets", "tarchetypes", "curl", "here", "visNetwork", "readr", "dplyr", "ggplot2") 
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

library(targets)
tar_option_set(packages = c("readr", "dplyr", "ggplot2"))
list(
  tarchetypes::tar_download(file, "https://raw.githubusercontent.com/wlandau/targets-four-minutes/refs/heads/main/data.csv", "data.csv"),
  tar_target(data, get_data(file)),
  tar_target(model, fit_model(data)),
  tar_target(plot, plot_model(model, data))
)