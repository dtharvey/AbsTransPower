library(shiny)

# initial set up

shinyUI(fluidPage(
  withMathJax(),
  tags$style(HTML("
                  h1{
                    font-size: 48px;
                  }
                 ")),
  
  fluidRow(column(
      width = 3,
      plotOutput("absorbance")
      ),
    column(
      width = 3,
      plotOutput("transmittance")
    ),
    column(
      width = 3,
      plotOutput("power_sample")
    ),
    column(
      width = 3,
      plotOutput("power_reference")
    )
  ),
  fluidRow(
    column(
      width = 9,
      offset = 2,
      align = "center",
      HTML("<h1>\\(A = -\\textrm{log}T =
            -\\textrm{log}\\left\\{ {P}_{\\textrm{sample}}/
            {P}_{\\textrm{reference}} \\right\\}\\)</h1>"
           ),
      h1(textOutput("equation"))
    )
  ),
  fluidRow(
    column(
      width = 8,
      HTML("<h3><center>Beer's Law</center></h3>"),
      HTML("<p>Demonstration of the relationship between the source's 
            power as passed by the reference, 
            \\({P}_{\\textrm{reference}}\\), the source's power as 
            passed by the sample, \\({P}_{\\textrm{sample}}\\), the 
            transmittance of the source's radiation by the sample, 
            <em>T</em>, and the absorbance of the source's radiation, 
            <em>A</em>, by the sample. Adjust the slider to change the 
            wavelength and view the
            relationship between the four values. Click on the  
            run button to advance through the wavelengths automatically 
            (note: because the animation advances at a rate of 
            1.33 nm/sec, you first may wish to adjust the initial wavelength 
            to a region of interest).</p>")
    ),
    column(
      width = 4,
      align = "center",
      br(),
      sliderInput("wavelength", "Wavelength?", min = 400, max = 750, 
                  step = 1, value = 400,
                  animate = 
                    animationOptions(interval = 750, 
                                     playButton = "Run",
                                     pauseButton = "Stop"))
    )
  )
    

  
# end of shiny ui
))