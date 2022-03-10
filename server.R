library(ggplot2)
library(plotly)
library(dplyr)
library(data.table)

lgbtq <- read.csv("trans-characters-in-youth-cartoons.csv")
plot1_title <- function(orientations) {
  start <- "Number of"
  middle <- "" # toString(orientations) # Runs off screen too often
  end <- "characters over time"
  return(paste(start, middle, end))
}

server <- function(input, output) {


  output$plot1 <- renderPlotly({
    if ("All" %in% input$orientation) {
      orientation_filter <- unique(lgbtq$orientation)
    } else {
      orientation_filter <- input$orientation
    }
    if ("All" %in% input$gender) {
      gender_filter <- unique(lgbtq$gender)
    } else {
      gender_filter <- input$gender
    }
    if ("All" %in% input$race) {
      race_filter <- unique(lgbtq$race)
    } else {
      race_filter <- input$race
    }
    
    lgbtq_data <- lgbtq %>%
      filter(orientation %in% orientation_filter) %>% 
      filter(gender %in% gender_filter) %>% 
      filter(race %in% race_filter) %>% 
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
    
    OverallGraphPt3 <- OverallGraphPt2 %>% mutate(ImplicitPercentage = 1-ExplicitPercentage)
    
    Graph <- ggplot(data = OverallGraphPt3) +
           geom_col(mapping = aes(x = input$role, y = ExplicitPercentage), group = 1, color = "red", fill = "white")+
            theme_dark() + scale_y_continuous(labels = scales::percent, limits = c(0,1)) + labs(title = "Explicit Percentages Based on the Role of Character", x = "role", y = "Explicit Percentage")
    
    my_plotly <- ggplotly(Graph)
    
    return(my_plotly)
  })
  
  output$plot3 <- renderPlotly({
    race_count <- lgbtq %>% group_by(year) %>% count(race)
    
    lgbtq <- lgbtq %>% filter(race %in% input$user_category) %>% filter(year %inrange% input$user_select) %>% group_by(year) %>% count(race)
    
    chart3 <- ggplot(data = lgbtq) + geom_col(mapping = aes(x = year, y = n, fill = race)) + xlab("Year") + ylab("Number of Cartoon Characters") + labs(title = "Representation of Race in LGBTQ Characters Over the Years")
    
    ggplotly(chart3)
    
    my_plotly_plot <- ggplotly(chart3)
    
    return(my_plotly_plot)
    
  })
}
