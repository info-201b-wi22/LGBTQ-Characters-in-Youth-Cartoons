library(ggplot2)
library(plotly)
library(bslib)
library(stringr)
lgbtq <- read.csv("trans-characters-in-youth-cartoons.csv")

intro_tab <- tabPanel(
  "Introduction",
  fluidPage( theme = bs_theme_update(theme = bs_theme(bootswatch = "flatly"), 
                                     primary = "#A337AE", success = "#FDF43E", base_font = font_google("Quicksand"), 
                                     font_scale = NULL, `enable-gradients` = TRUE, bootswatch = "flatly"),
    h1("Take a moment to think..."),
    em("When you were a kid, did you remember seeing LGBTQ characters on your cartoons? Do you remember the show ever mentioning that they were a part of the LGBTQ community? Were they a main, memorable character, or just simply a background filler on the side?"),

  p("In this investigation, we are exploring the representation of LGBTQ characters, specifically in cartoon shows made for children and teenagers. We want to know how the frequency of representation has changed over time, and when characters are explicitly stated to be LGBTQ or only implied as such. This has been a matter of importance and pride for the LGBTQ community to see themselves reflected in the media. For young children who are struggling with their identity and sexuality, seeing positive examples in television can be transformative for them. Since this is something the community has been fighting for a long time to see, it is most informative to compare how representation has changed over the years. We are also interested in how race, gender and orientation intersect. Seeing how representation of, say, transgender characters may or may not differ depending on their race is important to have a better understanding of what gaps persist in bringing greater diversity to children’s entertainment. A crucial part of using data science to challenge power in this regard is making those in power take responsibility for the effects of their actions. This includes knowing what entertainment companies are doing the worst at, including representation of characters that are not straight, cisgender men."),
    p(paste0("Thus, we found a dataset called"),
  
    HTML('<a class="link" href="https://www.kaggle.com/braddcarey/trans-characters-in-youth-cartoons?select=trans-characters-in-youth-cartoons.csv">LGBTQ Characters in Youth Cartoons</a>'),
  
  (", in order to research this further. Parsed by Insider.com's Bradd Carey, it contains hand collected and verified data of LGBTQ characters in children's cartoons from 1996 to today. Included with orientation is how the orientation was represented in the show, how it was confirmed, creating studio, character role, show rating and other characteristics. After reviewing the dataset, we found some limitations. For some LGBTQ characters of youth cartoons in the database, they lack the mention of their race, and/or they are not human. Similarly, some characters have an unknown orientation. This would probably lead to a harder time finding correlations between race, representation, gender, and/or orientation. Also, in the data set we found, if a character did not have an orientation listed, their gender written down would be slightly different than the characters that did. This will make it a little harder for our code to parse through our data. Another challenge is that many of the characters come from the same shows and puts most of the data into one place, limiting our variance. Additionally, the years column only goes back until 1996. This limits our dataframe to cartoons made only after that time, so that we cannot see if there were any LGBTQ cartoon characters before then. However, the dataset is still effective and valid enough to investigate, as it includes an abundance of information on LGTQ characters throughout the years that is too powerful to ignore. Hopefully, our research can bring about more positive reinforcement, acceptance, awareness, education, and inclusion of LGBTQ members to the youth populations and beyond." )),
  
  HTML('<img src="https://i.insider.com/60c21f916d855e00181574df" alt="LGBTQ Characters" width = "800">'),
  p(""),
  em("Some examples of LGBTQ characters in youth cartoons!")
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
    label = "Select role",
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
    p("This plot depicts the total number of characters matching the selected
      orientations, genders and races over time. There are many unique shapes
      to these curves, which can tell the story of several different 
      demographics. Interesting discoveries include the fact no nonbinary
      characters (save 1 genderless character from 2011) were recorded until
      2014! Or the 6 year difference between the first recorded gay male
      character and the first recorded lesbian character."),
    
    p("(Plot Note: To see changes to the graph based on your user input, deselect 'All' from the choices.)")
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
    p("This chart attempts to understand how the representation of race in LGBTQ cartoon characters has changed over the course of time. By seeing how the
      representation of race has changed over time, we can also examine the intersectionality between race and sexual orientation. Thus, we can view whether
      the races are equally represented and if there has become a more equal representation currently versus throughout history.")
  )
)

conclusion_tab <- tabPanel(
  "Conclusion",
  fluidPage(
    h1("Main Takeaways"),
    p("After the careful analysis of the dataset and the reviews of the charts we have made, we have determined that the representation of LGBTQ characters in youth cartoons has indeed increased, although there are some caveats and improvements that could be made. 
Our first takeaway was from our first graph, LGBTQ characters over time, that displays how as the years go on, the number of LGBTQ characters being introduced into children cartoons has increased significantly. This is a good sign that LGBTQ characters are showing up increasingly in children cartoons, which is a good step towards representation. "),
    p(" However, there are still some steps to be made. Our second takeaway came in our second graph, Explicit Representation of LGBTQ characters by role, and we can see that guest characters actually have the most explicit representation, while the least representation comes from main characters. This is still something the animation film industry could work on, as incorporating explicit representation to main characters could result in further awareness and acceptance from the audience cheering on and looking up to the main characters. "),
    p(" Our third takeaway comes from our third graph, Representation of LGBTQ characters over time by Race, and we found that as time went on, representation did grow for all races, but the most represented was the 'N/A' race. Although this could mean that there was not an explicit race for the character, it could also mean that the character was of a different species (for example, an animal, alien, or other lifeforms). In the future, having LGBTQ characters as an explicit human race, especially POC, could lead to more purposeful awareness for real life people. Children would realize that LGBTQ characters exist in real life all around them, and not just as an alien in a cartoon TV show. "),
    p(" Nevertheless, LGBTQ representation has improved over the years, and as it increases even further, education and inclusion will continue further as well. Cartoon animation studios have made great strides, and hopefully, will continue to do so."),
    HTML('<img src="https://mombian.com/images/kids_shows.png" alt="New LGBTQ Shows" width = "800">'),
    p(""),
    em("Some examples of new or recent cartoons/shoes with LGBTQ characters!")
    
  )
)

ui <- navbarPage(
  "LGBTQ Characters in Youth Cartoons",
  intro_tab,
  plot1_tab,
  plot2_tab,
  plot3_tab,
  conclusion_tab
)
