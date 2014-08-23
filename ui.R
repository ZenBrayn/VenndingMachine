# ui.R
library(shiny)

shinyUI(fixedPage(
  responsive = FALSE,
  titlePanel("The Vennding Machine"),
  em("Make your own Venn Diagram!"),
  br(),
  br(),
  strong("Instructions:"),
  br(),
  tags$li("To make a 2-way Venn Diagram, enter a list of items under 'Set 1 Elements' and 'Set 2 Elements' below.  Each item must be on its own line.  Optionally, names for each set can be entered under 'Set 1 Name' and 'Set 2 Name' and will be displayed in the resulting Venn diagram."),
  tags$li("To make a 3-way Venn Diagram, also enter a list of items for 'Set 3 Elements'.  Each item must be on its own line.  Optionally, 'Set 3 Name' can also be entered."),
  tags$li("Once at least 'Set 1 Elements' and 'Set 2 Elements' have been entered, a Venn diagram will be displayed in the main panel.  If 'Set 3 Elements' are also entered, the Venn diagram will switch to a 3-way Venn."),
  tags$li("If 'Set Name' fields are specified, these names will be display above each corresponding circle in the Venn diagram."),
  tags$li("The numbers in parentheses above each circle represent the total count of items corresponding to each set."),
  br(),

  sidebarLayout(
    sidebarPanel(
      textInput("set1name", "Set 1 Name"),
      tags$br(),
      HTML("Set 1 Elements"),
      tags$br(),
      tags$textarea(id="set1", rows=5, cols=30),
      tags$br(),
      tags$br(),
      textInput("set2name", "Set 2 Name"),
      tags$br(),
      HTML("Set 2 Elements"),
      tags$br(),
      tags$textarea(id="set2", rows=5, cols=30),
      tags$br(),
      tags$br(),
      textInput("set3name", "Set 3 Name"),
      tags$br(),
      HTML("Set 3 Elements"),
      tags$br(),
      tags$textarea(id="set3", rows=5, cols=30)
    ),
    
    mainPanel(
      plotOutput("venn"),
      width=6
    )
  )
  
))