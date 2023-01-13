install.packages("targets")
library(targets)
source("functions.R")
tar_option_set(packages = c("readr", "dplyr", "ggplot2", "MyPackage", "remotes"))
tar_option_set(envir = getNamespace("MyPackage"))

list(
  tar_target(model, fit_model(diamonds)),
  tar_target(plot_abline, plot_model(model)),
  tar_target(plot_boxplot, plot_stats(diamonds))
)
