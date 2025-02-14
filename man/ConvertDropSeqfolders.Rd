% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Seurat.Utils.R
\name{ConvertDropSeqfolders}
\alias{ConvertDropSeqfolders}
\title{ConvertDropSeqfolders}
\usage{
ConvertDropSeqfolders(
  InputDir,
  folderPattern = "SRR*",
  filePattern = "expression.tsv.gz",
  useVroom = TRUE,
  col_types.vroom = list(GENE = "c", .default = "d"),
  min.cells = 10,
  min.features = 200,
  updateHGNC = TRUE,
  ShowStats = TRUE,
  minDimension = 10,
  overwrite = FALSE
)
}
\arguments{
\item{InputDir}{A character string specifying the input directory.}

\item{folderPattern}{A character string specifying the pattern of folder names to be searched. Default: 'SRR*'.}

\item{filePattern}{A character string specifying the pattern of file names to be searched. Default: 'expression.tsv.gz'.}

\item{useVroom}{A logical value indicating whether to use vroom. Default: \code{TRUE}.}

\item{col_types.vroom}{A list defining column types for vroom. Default: list("GENE" = "c", .default = "d").}

\item{min.cells}{An integer value specifying the minimum number of cells. Default: 10.}

\item{min.features}{An integer value specifying the minimum number of features. Default: 200.}

\item{updateHGNC}{A logical value indicating whether to update the HGNC. Default: \code{TRUE}.}

\item{ShowStats}{A logical value indicating whether to show statistics. Default: \code{TRUE}.}

\item{minDimension}{An integer value specifying the minimum dimension. Default: 10.}

\item{overwrite}{A logical value indicating whether to overwrite files. Default: \code{FALSE}.}
}
\description{
This function takes a parent directory with a number of subfolders, each
containing the standard output of 10X Cell Ranger. It (1) loads the filtered data matrices,
(2) converts them to Seurat objects, and (3) saves them as .RDS files.
}
\examples{
\dontrun{
if (interactive()) {
  ConvertDropSeqfolders(InputDir = InputDir)
}
}
}
\seealso{
\code{\link[vroom]{vroom}}
\code{\link[readr]{read_delim}}
}
