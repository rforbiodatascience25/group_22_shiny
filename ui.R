library("shiny")
library("bslib")

# Define the User Interface (Frontend)
ui <- page_fluid(
  
  # Section 1: Title card
  layout_columns(
    col_widths = 12,
    card(
      titlePanel("Virtual Central Dogma"),
      style = "background-color: #f0f0f0; padding: 15px;"
    )
  ),
  
  # Section 2: About card
  layout_columns(
    col_widths = 12,
    card(
      titlePanel("About"),
      helpText("The following app can be used to the extract the transcripted mRNA sequence from a DNA sequence. 
      The app also contains amino acid data, therefore the translated amino acid sequence can be obtained from the mRNA sequence.
      A random DNA sequence can also be generated, with variable probabilities. The app also creates a bar chart on the distribution of the nucleotide bases."
     )
    )
  ),
  
  # Section 3: Virtual Gene Generator
  layout_columns(
    col_widths = 12,
    card(
      card_header("Virtual Gene Generator"),
      sliderInput(
        inputId = "n_bases",
        label = "Number of bases:",
        min = 1,
        max = 60,
        value = 30,
        width = "100%"
      ),
      layout_columns(
        col_widths = c(3, 3, 3, 3),
        numericInput(
          inputId = "prob_A",
          label = "Probability of A",
          value = 0.25,
          min = 0,
          max = 1,
          step = 0.1
        ),
        numericInput(
          inputId = "prob_T",
          label = "Probability of T",
          value = 0.25,
          min = 0,
          max = 1,
          step = 0.1
        ),
        numericInput(
          inputId = "prob_C",
          label = "Probability of C",
          value = 0.25,
          min = 0,
          max = 1,
          step = 0.1
        ),
        numericInput(
          inputId = "prob_G",
          label = "Probability of G",
          value = 0.25,
          min = 0,
          max = 1,
          step = 0.1
        )
      )
    )
  ),
  
  # Section 4: Gene output + RNA transcription
  layout_columns(
    col_widths = 12,
    
    # DNA output card
    card(
      card_header("Virtual Gene Output"),
      mainPanel(
        verbatimTextOutput(outputId = "dna"),
        plotOutput(outputId = "distPlot")
      )
    ),
    

    # RNA transcription input
    card(
      card_header("Virtual RNA Transcribe"),
      textInput(
        inputId = "vdna",
        label = "Enter the DNA sequence!",
        value = ""
      )
    ),
    
    # Transcribed RNA output card
    card(
      card_header("Transcribed RNA:"),
      mainPanel(
        verbatimTextOutput(outputId = "rna")
      )
    ),
    # Transcribe Codons to Amino-acids
    card(
      card_header("Transcribe RNA codons to Amino-acids: "),
      textInput(
        inputId = "ribbosomeInput",
        label = "Enter RNA codons to be transcribed.",
        value = ""
      )
    ),
    # Transcribed Amino Acid output card
    card(
      card_header("Transcribed Amino-acids:"),
      mainPanel(
        verbatimTextOutput(outputId = "aminoAcids")
      )
    ),
  )
)
