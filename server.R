library(ggplot2)
library(plotly)
library(dplyr)

# co2 <- read.csv("owid-co2-data.csv")
# hotdog_df <- read.csv("https://raw.githubusercontent.com/apreshill/data-vis-labs-2018/master/data/hot_dog_contest.csv")

# custom_legend_titles <- reactiveValues("year" = "Year of Contest", "gender" = "Gender of Athlete", "name" = "Name of Athlete")

# custom_titles <- create custom titles

server <- function(input, output) {
  # 
  # 
  # output$plot <- renderPlotly({
  #   # Make a scatter plot of the number of hot dogs eaten over time
  #   # Allow the user to select the color category
  #   co2_filtered <- co2 %>% 
  #     filter(year >= input$start) %>% 
  #     filter(country %in% input$user_category)
  #   my_plot <- ggplot(data = co2_filtered) +
  #     # color = get(input$user_category)
  #     geom_line(mapping = aes(x = year, y = share_global_co2, color= country,
  #                             text = paste0("Country: ", country,"<br>",
  #                                           "Year: ", year),
  #                             group = 1)) +
  #     labs(title = "Share of co2 emissions over time", color = "Country/Region",
  #          x = "Year", y = "Percent global emissions")
  #   
  #   # labs(title = "Title", color = custom_legend_titles[[input$user_category]])
  #   
  #   # Make interactive plot
  #   # Remove mode bar
  #   my_plotly_plot <- ggplotly(my_plot, tooltip = "text") %>%
  #     config(displayModeBar = FALSE)
  #   
  #   return(my_plotly_plot)
  # })
  # 
  # # Calculate Summary Values:
  # output$us_share_1950 <- co2 %>% 
  #   filter(year == 1950, country == "United States") %>% 
  #   pull(share_global_co2) %>% 
  #   renderText()
  # 
  # output$us_share_2020 <- co2 %>% 
  #   filter(year == 2020, country == "United States") %>% 
  #   pull(share_global_co2) %>% 
  #   renderText()
  # 
  # 
  # output$us_cumulative_share_1950 <- co2 %>% 
  #   filter(year == 1950, country == "United States") %>% 
  #   pull(share_global_cumulative_co2) %>% 
  #   renderText()
  # 
  # output$us_cumulative_share_2020 <- co2 %>% 
  #   filter(year == 2020, country == "United States") %>% 
  #   pull(share_global_cumulative_co2) %>% 
  #   renderText()
  # 
  # output$eur_cumulative_share_1950 <- co2 %>% 
  #   filter(year == 1950, country == "Europe") %>% 
  #   pull(share_global_cumulative_co2) %>% 
  #   renderText()
  # 
  # output$eur_cumulative_share_2020 <- co2 %>% 
  #   filter(year == 2020, country == "Europe") %>% 
  #   pull(share_global_cumulative_co2) %>% 
  #   renderText()
}
