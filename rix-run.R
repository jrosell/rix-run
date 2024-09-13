
args <- commandArgs(trailingOnly=TRUE)
if (length(args) > 0) {
  file_lines <- readLines(args[1])

  r_ver <- grep("^#' @rix r_ver ", file_lines, value = TRUE)
  if (length(r_ver) > 0) {
    r_ver <- sub("^#' @rix ", "", r_ver)
    r_ver <- parse(text = r_ver)
  } else{
    r_ver = NULL
  }  
  r_pkgs <- grep("^#' @rix r_pkgs ", file_lines, value = TRUE)
  if (length(r_pkgs) > 0) {
    r_pkgs <- sub("^#' @rix ", "", r_pkgs)
    r_pkgs <- parse(text = r_pkgs)
  } else{
    r_pkgs = NULL
  }      
  system_pkgs <- grep("^#' @rix system_pkgs ", file_lines, value = TRUE)
  if (length(system_pkgs) > 0) {
    system_pkgs <- sub("^#' @rix ", "", system_pkgs)
    system_pkgs <- parse(text = system_pkgs)
  } else{
    system_pkgs = NULL
  }
  git_pkgs <- grep("^#' @rix git_pkgs ", file_lines, value = TRUE)
  if (length(git_pkgs) > 0) {
    git_pkgs <- sub("^#' @rix ", "", git_pkgs)
    git_pkgs <- parse(text = git_pkgs)
  } else{
    git_pkgs = NULL
  }
}
sink("/dev/null")
suppressMessages(suppressWarnings({
  if(!requireNamespace("rix")) {
    install.packages("rix", repos = c(
      "https://ropensci.r-universe.dev",
      "https://cloud.r-project.org"
    ))
  }
  library(rix)
  path_default_nix <- tempdir()
  rix::rix(
    eval(r_ver),
    eval(r_pkgs),
    eval(system_pkgs),
    eval(git_pkgs),
    overwrite = TRUE,
    print = FALSE,
    project_path = path_default_nix,
    ide = "other"
  )
}))
sink()
cat(paste0(path_default_nix, "/default.nix\n"))