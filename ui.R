library(ggplot2)
library(plotly)
lgbtq <- read.csv("trans-characters-in-youth-cartoons.csv")

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

plot1_sidebar <- sidebarPanel(
  selectInput(
    inputId = "orientation",
    label = "Character Orientation",
    choices = unique(lgbtq$orientation),
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

plot1_main <- mainPanel(
  # plotlyOutput(outputId = "plot")
)

plot2_sidebar <- sidebarPanel(
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

plot2_main <- mainPanel(
  # plotlyOutput(outputId = "plot")
)

plot3_sidebar <- sidebarPanel(
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

plot3_main <- mainPanel(
  # plotlyOutput(outputId = "plot")
)

plot1_tab <- tabPanel(
  "Plot",
  sidebarLayout(
    plot1_sidebar,
    plot1_main,
  ),
  fluidPage(
    p("")
  )
)

plot2_tab <- tabPanel(
  "Plot",
  sidebarLayout(
    plot2_sidebar,
    plot2_main,
  ),
  fluidPage(
    p("")
  )
)

plot3_tab <- tabPanel(
  "Plot",
  sidebarLayout(
    plot3_sidebar,
    plot3_main,
  ),
  fluidPage(
    p("")
  )
)

ui <- navbarPage(
  "LGBTQ Characters in Youth Cartoons",
  intro_tab,
  plot1_tab,
  plot2_tab,
  plot3_tab
)