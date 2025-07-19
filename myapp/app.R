library(shiny)
library(DT)
#library(shinylive)
#library(here)
#library(nanoparquet)

# shinylive::export(appdir = "myapp", destdir = "docs")
# setwd("~/OneDrive - KU Leuven/LabFiles/Projects/0002_AstroMAP/AstroMAP/08_Webtool/test2")
# httpuv::runStaticServer("docs/", port = 8008)
# Load the parquet data (adjust the path to your file)
#ensembl_data <- read.csv("docs/ensembl98.csv")


#ensembl_data <- read.csv("https://github.com/fpestana-git/test2/blob/main/docs/ensembl98.csv")
#ensembl_data <- read.csv("https://raw.githubusercontent.com/fpestana-git/test2/main/docs/ensembl98.csv")

ensembl_data <- read.csv("https://raw.githubusercontent.com/fpestana-git/test2/refs/heads/main/docs/ensembl98.csv")

#ensembl_data <- mtcars
#ensembl_data <- read.csv(here("docs", "ensembl98.csv"))

ui <- navbarPage(
  "AstroMap",   
  tabPanel("Overview", "Here you can explore the intega"),
  tabPanel("RNA-seq",
           DTOutput("rnaTable")   # Display the data table here
  ),
  tabPanel("Spatial", "spatial"),
  navbarMenu("Regional", 
             tabPanel("Isocortex", "four-a"),
             tabPanel("HPF", "four-b"),
             tabPanel("OLF", "four-c")
  )
)

# Define server logic required to draw a histogram ----
server <- function(input, output, session) {
  
  # Render the RNA-seq data table
  # output$rnaTable <- renderDT({
  #   datatable(ensembl_data, options = list(pageLength = 10))
  # })
  
}

# Create Shiny app ----
shinyApp(ui = ui, server = server)
