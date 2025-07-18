library(shiny)
library(DT)

# shinylive::export(appdir = "myapp", destdir = "docs")
# Load the parquet data (adjust the path to your file)
ensembl_data <- readRDS("data/ensembl98.rds")


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
  output$rnaTable <- renderDT({
    datatable(ensembl_data, options = list(pageLength = 10))
  })
  
}

# Create Shiny app ----
shinyApp(ui = ui, server = server)
