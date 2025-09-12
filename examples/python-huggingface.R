#' @rix date = "2025-09-01"
#' @rix r_pkgs = c("reticulate", "text")
#' @rix git_pkgs = list(package_name = "huggingfaceR", repo_url = "https://github.com/farach/huggingfaceR/", commit = "a9dc96af798e30ef58c3d89d80ac05f5a1f044e5")

# pak::pak(c("reticulate", "text", "farach/huggingfaceR"))

texts <- c("I feel great!")

library(reticulate)
options(timeout = 999)
reticulate::install_miniconda(force = TRUE)

library(text)
textrpp_install(prompt = FALSE)
reticulate::conda_list()
textrpp_initialize()

bert_embeddings <- textEmbed(texts)
bert_embeddings |> 
  saveRDS(file = here::here('examples', 'python-embeddings-bert.rds'))

Sys.setenv("HUGGINGFACE_ENV" = "textrpp_condaenv")
library(huggingfaceR)
minilm_model <- hf_load_sentence_model("paraphrase-MiniLM-L6-v2")
minilm_embeddings <- minilm_model$encode(texts)
minilm_embeddings |> 
  saveRDS(file = here::here('examples', 'python-embeddings-minilm.rds'))