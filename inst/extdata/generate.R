library(rix)
rix::rix(
  r_ver = "4.3.3",
  r_pkgs = c(
    "codetools",
    "curl",
    "jsonlite",
    "sys",
    "R_utils"
  ),
  git_pkgs = list(package_name = "rix", repo_url = "https://github.com/ropensci/rix/", commit = "a0367da5094c73e8c4d568f95708a46e392df8ce"),
  project_path = here::here("inst/extdata"),
  overwrite = TRUE
)
if (file.exists(here::here("inst/extdata/nix.nix"))) {
  unlink(here::here("inst/extdata/nix.nix"))
}
if (file.exists(here::here("inst/extdata/.Rprofile"))) {
  unlink(here::here("inst/extdata/.Rprofile"))
}
file.rename(
    here::here("inst/extdata/default.nix"),
    here::here("inst/extdata/rix.nix")
)
