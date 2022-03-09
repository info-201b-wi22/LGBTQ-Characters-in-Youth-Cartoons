library(ggplot2)
library(plotly)
library(bslib)
lgbtq <- read.csv("trans-characters-in-youth-cartoons.csv")

intro_tab <- tabPanel(
  "Introduction",
  fluidPage( theme = bs_theme_update(theme = bs_theme(bootswatch = "flatly"), 
                                     primary = "#A337AE", success = "#FDF43E", base_font = font_google("Quicksand"), 
                                     font_scale = NULL, `enable-gradients` = TRUE, bootswatch = "flatly"),
    h1("The Dataset"),
    p(""),
    h1("Summary"),
    p("")
  )
)

plot1_sidebar <- sidebarPanel(
  selectInput(
    inputId = "orientation",
    label = "Character Orientation",
    choices = c("All", unique(lgbtq$orientation)),
    selected = "All",
    multiple = T
  ),
  selectInput(
    inputId = "gender",
    label = "Character Gender",
    choices = c("All", unique(lgbtq$gender)),
    selected = "All",
    multiple = T
  ),
  selectInput(
    inputId = "race",
    label = "Character Race",
    choices = c("All", unique(lgbtq$race)),
    selected = "All",
    multiple = T
  )
)

plot1_main <- mainPanel(
  plotlyOutput(outputId = "plot1")
)

plot2_sidebar <- sidebarPanel(
  selectInput(
    inputId = "role",
    label = "Select the role",
    choices = unique(lgbtq$role),
    selected = "Guest Character",
    multiple = TRUE)
)

plot2_main <- mainPanel(
  plotlyOutput(outputId = "plot2")
)

plot3_sidebar <- sidebarPanel(
  selectInput(
    inputId = "user_category",
    label = "Select Race(s):",
    choices = lgbtq$race,
    selected = "POC",
    multiple = T
  ),
  sliderInput(
    inputId = "user_select",
    label = "Select Year Range:",
    value = c(1996, 2020),
    min = 1996,
    max = 2021,
    step = 1
  )
)

plot3_main <- mainPanel(
  plotlyOutput(outputId = "plot3")
)

plot1_tab <- tabPanel(
  "Chart One",
  sidebarLayout(
    plot1_sidebar,
    plot1_main,
  ),
  fluidPage(
    p("")
  )
)

plot2_tab <- tabPanel(
  "Chart Two",
  sidebarLayout(
    plot2_sidebar,
    plot2_main,
  ),
  fluidPage(
    p("This chart derives from question of how explitcy of the characters might vary based on the role they are assigned. Impact of explicitness
      character holds can vary based on the weight which character holds in the show. By looking at the chart we are able to get this question answered.")
  )
)

plot3_tab <- tabPanel(
  "Chart Three",
  sidebarLayout(
    plot3_sidebar,
    plot3_main,
  ),
  fluidPage(
    p("This chart attempts to understand how the representation of race in LGBTQ cartoon characters has changed over the course of time. By seeing how the representation of race has changed over time, we can also examine the intersectionality between race and sexual orientation. Thus, we can view whether the races are equally represented and if there has become a more equal representation currently versus throughout history.")
  )
)

ui <- navbarPage(
  "LGBTQ Characters in Youth Cartoons",
  intro_tab,
  plot1_tab,
  plot2_tab,
  plot3_tab
)