---
title       : Predicting child length from parent length 
subtitle    : a coursera project
author      : Elwin Kamp
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Introduction

In the late 19th century, Sir Francis Galton observed that characteristics like length where not passed on completely from parent to offspring.

Using advanced data science, child length can now be predicted from parent length...



--- 

## Data

Using the Galton data, a trainingset and a testset where created  to build our machinelearning algorithm.

```r
library(caret)
library(HistData)
set.seed(998)
inTraining <- createDataPartition(Galton$parent, p = .75, list = FALSE)
training <- Galton[ inTraining,]
testing  <- Galton[-inTraining,]
head(training)
```

--- 

## Creating the model

Using the caret package, a linear model was created to predict child lenght from parent length.

```r
modFit <- train(child ~ parent,data=training,method="lm")
summary(modFit$finalModel)
```
```
## Call:
## lm(formula = .outcome ~ ., data = dat)
## 
## Residuals:
##    Min     1Q Median     3Q    Max 
## -7.817 -1.336  0.023  1.664  5.984 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept) 22.97266    3.24795   7.073  3.7e-12 ***
## parent       0.66020    0.04753  13.890  < 2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 
```

--- 

## Results

The final model for predicting child length from parent lenght is shown below:

```r
childheight = 0.66*parentheight + 23
```



You can test the algorithm with your own parents' length at the following URL!

https://ekamp.shinyapps.io/Dataproducts
