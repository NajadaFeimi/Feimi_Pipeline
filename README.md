# Najada's Simple Pipeline
## Introduction
This is a simple pipeline I created for the workshop "Statec" of my Master Degree in Data Science. This is my first time working independetly and exploring these topics. I took inspiration from the simple pipeline tutorial created by the author of targets, but I chose a more difficult way to arrive at the same results. I firstly created a Package with three functions in it, the first one **fits a linear model to the diamonds dataframe where price is the dependent variable and carat is the independent variable**, the second one **displays a scatterplot of the fitted model** and the third **plots a jitter boxplot where the jitter datapoint show the relation between carats and the price for each diamond cut and the boxplot shows the distribution**.
I documented the package and each function. I then checked with ?*name_of_function* the R documentation of each function. Afterwards I performed unit tests as described below and then called these functions using MyPackage in the pipeline.

## The workflow:

1. **MyPackage** can be found at this repository: [https://github.com/NajadaFeimi/MyPackage](https://github.com/NajadaFeimi/MyPackage)
This package has three functions in it and they all work with the free dataset diamonds
* fit_model 
* plot_model 
* plot_stats 

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
Taken into account that my functions were simple, I decided to check the type of the *output* as seen above. 

I also checked the *input* putting a simple if condition like:
```sh
 if (!(is.data.frame({{data}}))){
    stop("Your input should be a dataframe.")
  }
```
for my function fit_model and plot_stats which take data as an input. 

3. Pipeline

The pipeline uses the functions defined in my package like: 

```sh
fit_model <- function(data) {
  MyPackage::fit_model()
}
```

***In order to run this pipeline please take these steps:***

Open a new project by clonning this repository: 

```sh
git@github.com:NajadaFeimi/Feimi_Pipeline.git
```
```sh
renv::restore()
```

```sh
targets::tar_make()
```

This should run the pipeline.

Also, in order to run the functions within it, one should follow this way: 

*Example*

```sh
targets::tar_read(plot_abline)
```
*Extra*

Working in the project: 

Pros: 
* I finally understood what renv does. ***Hooray**
* It was fun connecting the dots on how to relate everything we took in the course
* I learned a lot by debugging by myself.

Remarks and self-criticism: 
* There is a long way ahead
* I also explored Shiny app, but did not have enough time to check on how to relate it to the package or the pipeline
* Also I would like to explore in something more complicated also.
* Some things could be done better, but I had a lot of errors sometimes and I tried to simplify things.
