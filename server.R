# Define the Server (Backend)
server <- function(input, output) {
  output$dna <- renderText({
    gene_dna(length = input$n_bases, 
             base_probs = c(input$prob_A, input$prob_T, input$prob_C, input$prob_G))
  })
  output$distPlot <- renderPlot({
    
    x <- input$vdna
    count_A <- lengths(regmatches(x, gregexpr("A", x)))
    count_T <- lengths(regmatches(x, gregexpr("T", x)))
    count_C <- lengths(regmatches(x, gregexpr("C", x)))
    count_G <- lengths(regmatches(x, gregexpr("G", x)))
    
    counts <- c(A = count_A, T = count_T, C = count_C, G = count_G)
    
    barplot(counts, 
            col = "#75AADB", 
            border = "white",
            xlab = "Nucleotide",
            ylab = "Count",
            main = "Nucleotide Counts")
  })

  output$rna <- renderText({
    transcribe_dna(dna = input$vdna)
  })
}