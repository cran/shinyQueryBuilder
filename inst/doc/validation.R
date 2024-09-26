## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(shinyQueryBuilder)

## ----eval = FALSE-------------------------------------------------------------
#  queryFilter(
#    "BirthDate", type = "Date", validation = list(format = "YYYY-MM-DD")
#  )
#  queryFilter(
#    "Name", type = "character", input = "text", validation = list(format = "[A-Z][a-z]+")
#  )

## ----eval = FALSE-------------------------------------------------------------
#  queryFilter(
#    "digit", type = "integer", validation = list(min = 0, max = 9, step = 1)
#  )
#  queryFilter(
#    "weekday_abbr", type = "character", input = "textarea", validation = list(min = 3, max = 3)
#  )

## ----eval = FALSE-------------------------------------------------------------
#  queryFilter(
#    "digit", type = "numeric",
#    validation = list(
#      min = 0, max = 9, step = 1,
#      messages = list(
#        min = "Minimum value allowed is 0",
#        max = "Maximum value allowed is 9",
#        step = "Only integers accepted"
#      )
#    )
#  )
#  queryFilter(
#    "Name", type = "character", input = "text",
#    validation = list(format = "[A-Z][a-z]+", messages = list(format = "Name should be capitalized"))
#  )

## ----eval = FALSE-------------------------------------------------------------
#  queryFilter(
#    "fav_letter",
#    type = "character",
#    input = "text",
#    validation = list(
#      callback = js(paste0(
#        "function(value, Rule) {",
#        "var result = true;",
#        "is_valid = value.length == 1 && value.toUpperCase() == value;",
#        "if (!is_valid) {result = 'Single capital letter allowed only'};",
#        "return result;",
#        "}",
#        collapse = ""
#      ))
#    )
#  )

## ----eval = FALSE-------------------------------------------------------------
#  library(shiny)
#  pkgload::load_all()
#  
#  ui <- fluidPage(
#    queryBuilderInput(
#      "qb",
#      filters = list(
#        queryFilter(
#          "BirthDate", type = "Date", validation = list(format = "YYYY-MM-DD")
#        ),
#        queryFilter(
#          "digit", type = "numeric",
#          validation = list(
#            min = 0, max = 9, step = 1,
#            messages = list(
#              min = "Minimum value allowed is 0",
#              max = "Maximum value allowed is 9",
#              step = "Only integers accepted"
#            )
#          )
#        ),
#        queryFilter(
#          "Name", type = "character", input = "text",
#          validation = list(format = "[A-Z][a-z]+", messages = list(format = "Name should be capitalized"))
#        ),
#        queryFilter(
#          "weekday_abbr", type = "character", input = "textarea", validation = list(min = 3, max = 3)
#        ),
#        queryFilter(
#          "fav_letter",
#          type = "character",
#          input = "text",
#          validation = list(
#            callback = js(paste0(
#              "function(value, Rule) {",
#              "var result = true;",
#              "is_valid = value.length == 1 && value.toUpperCase() == value;",
#              "if (!is_valid) {result = 'Single capital letter allowed only'};",
#              "return result;",
#              "}",
#              collapse = ""
#            ))
#          )
#        )
#      )
#    ),
#    shiny::verbatimTextOutput("expr")
#  )
#  
#  server <- function(input, output, session) {
#    output$expr <- renderPrint({
#      print(queryToExpr(input$qb))
#    })
#  }
#  
#  shinyApp(ui, server, options = list(launch.browser = TRUE))

