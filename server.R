library(ggplot2)
library(plotly)
library(dplyr)

lgbtq <- read.csv("trans-characters-in-youth-cartoons.csv")
plot1_title <- function(orientations) {
  start <- "Number of"
  middle <- "" # toString(orientations) # Runs off screen too often
  end <- "characters over time"
  return(paste(start, middle, end))
}

server <- function(input, output) {


  output$plot1 <- renderPlotly({
    
    lgbtq_data <- lgbtq %>%
      filter(orientation %in% input$orientation) %>% 
      filter(gender %in% input$gender) %>% 
      filter(race %in% input$race) %>% 
      group_by(year) %>% 
      summarise(nchars = n())
    
    my_plot <- ggplot(data = lgbtq_data) +
      # color = get(input$user_category)
      geom_line(mapping = aes(x = year, y = nchars,
                              text = paste0("Characters: ", nchars,"<br>",
                              "Year: ", year),
                              group = 1)) +
      labs(title = plot1_title(input$orientation),
           x = "Year", y = "Characters")

    # labs(title = "Title", color = custom_legend_titles[[input$user_category]])

    # Make interactive plot
    # Remove mode bar
    my_plotly_plot <- ggplotly(my_plot, tooltip = "text") #%>%
      # config(displayModeBar = FALSE)

    return(my_plotly_plot)
  })
  
  
  output$plot2 <- renderPlotly({
    TotalNum <- lgbtq %>% count(role)
    
    ImplicitFilteredNum <- lgbtq %>% filter(representation == 'Implicit') %>% count(role) 
    
    ExplicitFilteredNum <- lgbtq %>% filter(representation == 'Explicit') %>% count(role) 
    
    OverallGraph <- ImplicitFilteredNum %>% mutate(ExplicitPercentage = ExplicitFilteredNum$n/TotalNum$n)
    
    OverallGraphPt2 <- OverallGraph %>% filter(role %in% input$role)
    
    Graph <- ggplot(data = OverallGraphPt2) + geom_col(mapping = aes(x = input$role, y = ExplicitPercentage), group = 1, color = "red", fill = "white") + theme_dark() + scale_y_continuous(labels = scales::percent) + labs(title = "Explicit percentages based on the role of character", x = "role", y = "Explicit Percentage")
    
    my_plotly <- ggplotly(Graph)
    
    return(my_plotly)
  })
  
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
