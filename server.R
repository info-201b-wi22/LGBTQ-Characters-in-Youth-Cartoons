library(ggplot2)
library(plotly)
library(dplyr)

lgbtq <- read.csv("trans-characters-in-youth-cartoons.csv")

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
