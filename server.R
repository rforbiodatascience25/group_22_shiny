# Load needed functions
source(file = "app_functions.R")

# Define the Server (Backend)
server <- function(input, output) {
  output$dna <- renderText({
    gene_dna(length = input$n_bases, 
             base_probs = c(input$prob_A, input$prob_T, input$prob_C, input$prob_G))
  })
  output$rna <- renderText({
    transcribe_dna(dna = input$vdna)
  })
  output$aminoAcids <- renderText({
    translate_rna(input$ribbosomeInput)
  })
}