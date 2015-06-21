shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Child length predictor"),
    sidebarPanel(
      h4('Use this advanced algorithm to predict child height from parent height. The algorithm was created using the Galton data'),
      numericInput('parentHeight', 'Height of Parent in inches', 65, min = 30, max = 80, step = 1),
      submitButton('Submit')
      ),
    mainPanel(
      h3('Results of prediction'),
      h4('You entered the following parent height:'),
      verbatimTextOutput("inputValue"),
      h4('Which resulted in a predicted child height of: '),
      verbatimTextOutput("prediction"),
      plotOutput("plot")
    )
  )
)