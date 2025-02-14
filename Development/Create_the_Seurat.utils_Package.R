######################################################################################################
# Create_the_Seurat.utils_Package.R
######################################################################################################
# file.edit("~/GitHub/Packages/Seurat.utils/Development/Create_the_Seurat.utils_Package.R")
# rm(list = ls(all.names = TRUE)); try(dev.off(), silent = TRUE)


# Functions ------------------------
require(PackageTools)
r$PackageTools()
# devtools::load_all("~/GitHub/Packages/PackageTools")

# Setup ------------------------
repository.dir <- "~/GitHub/Packages/Seurat.utils"
(package.name <- basename(repository.dir))
config.path <- file.path(repository.dir, "Development/config.R")

"TAKE A LOOK AT"
file.edit(config.path)
source(config.path)


PackageTools::document_and_create_package(repository.dir, config_file = 'config.R')
'git add commit push to remote'
file.edit("DESCRIPTION")

# Install your package ------------------------------------------------
"disable rprofile by"
source('~/GitHub/Packages/Rocinante/R/Rocinante.R')
rprofile()
devtools::install_local(repository.dir, upgrade = F)
PackageTools:::.parse_description(config_path = config.path)


# Test if you can install from github ------------------------------------------------
remote.path <- file.path(DESCRIPTION$'github.user', package.name)
# pak::pkg_install(remote.path)

devtools::install_github(repo = "vertesy/Seurat.utils", upgrade = F)

# unload(package.name)
# require(package.name, character.only = TRUE)
# # remove.packages(package.name)

# if (!require("BiocManager", quietly = TRUE))
#   install.packages("BiocManager")
# BiocManager::install(version = "3.18")
# BiocManager::install("MatrixGenerics")

# CMD CHECK ------------------------------------------------
devtools::check_man(repository.dir)
checkres <- devtools::check(repository.dir, cran = FALSE)


# Automated Codebase linting to tidyverse style ------------------------------------------------
styler::style_pkg(repository.dir)
# styler::style_file("~/GitHub/Packages/Seurat.utils/R/Seurat.Utils.Visualization.R")


# Extract package dependencies ------------------------------------------------
PackageTools::extract_package_dependencies(repository.dir)
# I have a list of functions where some are not properly separated at the bottom. Answer in text, not code.
# I need the following:
#   1. Generate a simple,unique, sorted list of function names, one function per line.
# 2. Identify the packages that contain these functions and provide a list of the corresponding packages for each function. Also make an R vector of the package names.
# 3. Acknowledge that some functions may not have an easily identifiable package.


# Visualize function dependencies within the package------------------------------------------------
{
  warning("works only on the installed version of the package!")
  pkgnet_result <- pkgnet::CreatePackageReport(package.name)
  fun_graph     <- pkgnet_result$FunctionReporter$pkg_graph$'igraph'
  PackageTools::convert_igraph_to_mermaid(graph = fun_graph, openMermaid = T, copy_to_clipboard = T)
}


# Try to find and add missing @importFrom statements------------------------------------------------
devtools::load_all("~/GitHub/Packages/PackageTools/")
(ls.scripts.full.path <- list.files(file.path(repository.dir, "R"), full.names = T, pattern = '.R$'))
if (F) {
  (excluded.packages <- unlist(strsplit(DESCRIPTION$'depends', split = ", ")))
  for (scriptX in ls.scripts.full.path) {
    PackageTools::add_importFrom_statements(scriptX, exclude_packages = excluded.packages)
  }
}


# Generate the list of functions ------------------------------------------------
(ls.scripts.full.path <- list.files(file.path(repository.dir, "R"), full.names = T, pattern = '.R$'))
for (scriptX in ls.scripts.full.path) {
  PackageTools::list_of_funs_to_markdown(scriptX)
}
file.edit(paste0(repository.dir, "R/list.of.functions.in.", package.name, ".det.md"))
file.edit(paste0(repository.dir, "/README.md"))
file.remove(paste0(repository.dir, "/R/list.of.functions.in.", package.name, ".det.md"))

r$PackageTools()
PackageTools::copy_github_badge("active") # Add badge to readme via clipboard
file.edit(paste0(repository.dir, "README.md"))


# Replaces T with TRUE and F with FALSE ------------------------------------------------
(ls.scripts.full.path <- list.files(file.path(repository.dir, "R"), full.names = T, pattern = '.R$'))
for (scriptX in ls.scripts.full.path) {
  PackageTools::replace_tf_with_true_false(scriptX)
  PackageTools::replace_short_calls(scriptX)
}





