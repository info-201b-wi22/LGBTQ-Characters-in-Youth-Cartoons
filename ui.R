library(ggplot2)
library(plotly)


intro_tab <- tabPanel(
  "Introduction",
  fluidPage(
    h1("The Dataset"),
    p(""),
    p("Jackson was here"),
    h1("Summary"),
    p("")
  )
)

plot_sidebar <- sidebarPanel(
  selectInput(
    inputId = "user_category",
    label = "Countries",
    choices = c("Choice 1", "Choice 2"),
    selected = "Choice 1",
    multiple = T
  ),
  sliderInput(
    inputId = "start",
    label = "Start date:",
    value = 1950,
    min = 1950,
    max = 2019
  )
)

plot_main <- mainPanel(
  # plotlyOutput(outputId = "plot")
)

plot_tab <- tabPanel(
  "Plot",
  sidebarLayout(
    plot_sidebar,
    plot_main,
  ),
  fluidPage(
    p("")
  )
)


value_sensitive_tab <- tabPanel(
  "Value Sensitive Design",
  p("f")
)


ui <- navbarPage(
  "LGBTQ Characters in Youth Cartoons",
  intro_tab,
  plot_tab,
  value_sensitive_tab
)