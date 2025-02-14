% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Seurat.Utils.R
\name{filterExpressedGenes}
\alias{filterExpressedGenes}
\title{Filter and Sort Gene Expression List Based on Specified Genes and Expression Threshold}
\usage{
filterExpressedGenes(
  genes,
  gene_list = all.genes,
  sort_by_expr = TRUE,
  threshold = 0.1
)
}
\arguments{
\item{genes}{Character vector of gene symbols to search for in the gene list. Default: NULL.}

\item{gene_list}{A named list of gene expression values where names are gene symbols, and values are
expression levels. Default:  all.genes}

\item{sort_by_expr}{Logical value specifying whether to sort the resulting gene list by expression level.}

\item{threshold}{Numeric value specifying the minimum expression level for filtering. Genes with
expression values below this threshold will be excluded. Default: 0.1.}
}
\value{
A character vector of gene symbols that match the specified list, meet the expression threshold,
and are sorted in descending order by expression level.
}
\description{
This function takes a named list of gene expression values and a character vector of gene
symbols. It identifies the intersection of gene symbols with names in the list, filters genes based on a
specified expression threshold, and returns a character vector of genes that meet the criteria, sorted
by expression in descending order.
}
\examples{
# Example usage:
gene_list <- list(ROBO2 = 0.9982406, CDH18 = 0.9981755, DCC = 0.9981755, AL589740.1 = 0.9981103)
genes <- c("ROBO2", "DCC", "AL589740.1", "UNKNOWN")
filterExpressedGenes(gene_list, genes, threshold = 0.9981)

}
