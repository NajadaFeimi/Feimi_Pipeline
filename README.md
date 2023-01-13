# Najada Feimi Simple Pipeline
## Introduction
This is a simple pipeline I created for the workshop "Statec" of my Master Degree in Data Science. 

The workflow:

1. First I created a package called **MyPackage** which can be found at this repository: [https://github.com/NajadaFeimi/MyPackage](https://github.com/NajadaFeimi/MyPackage)
This package has three functions in it and they all work with the free dataset diamonds
* fit_model **fits a linear model to the diamonds dataframe where price is the dependent variable and carat is the independent variable**
* plot_model **displays a scatterplot of the fitted model**
* plot_stats **plots a jitter boxplot where the jitter datapoint show the relation between carats and the price for each diamond cut and the boxplot shows the distribution**

Note: Everything is documented and described as needed

2. Performed **unit tests** in the package using the package : usethis.

The test files were created for my two chosen functions and they look like this:

* test-fit_model.R
```sh
  test_that("check output type", {
  expect_identical(class(fit_model()), "lm")
})

  ```
* test-plot_model.R
```sh
test_that("Check output type for plot", {
  plot <- plot_model(fit_model())
  setequal(class(plot), c("gg", "ggplot"))
})
```
Taken into account that my functions were simple, I decided to check the type of the output as seen above. 

I also checked the input putting a simple if condition like:
```sh
 if (!(is.data.frame({{data}}))){
    stop("Your input should be a dataframe.")
  }
```


