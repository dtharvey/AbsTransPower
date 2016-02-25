library(shiny)

shinyServer(function(input, output) {

load(file = "AbsTranPower.RData")

output$transmittance = renderPlot({
  plot(data$wavelength, data$trans, type = "l", lwd = 3, col = "blue",
       xlab = "wavelength (nm)", ylab = "transmittance", 
       main = paste0("Transmission = ", trans()), ylim = c(0, 1))
  abline(v = data$wavelength[input$wavelength-399], lwd =3, col = "red")
})

output$power_sample = renderPlot({
  plot(data$wavelength, data$p_sam, type = "l", lwd = 3, col = "blue",
       xlab = "wavelength (nm)", ylab = expression(italic(P)[sample]), 
       main = paste0("Sample Power = ", psam()), ylim = c(0, 1))
  abline(v = data$wavelength[input$wavelength-399], lwd =3, col = "red")
})

output$absorbance = renderPlot({
  plot(data$wavelength, data$abs, type = "l", lwd = 3, col = "blue",
       xlab = "wavelength (nm)", ylab = "absorbance", 
       main = paste0("Absorbance = ", abs()), ylim = c(0, 1))
  abline(v = data$wavelength[input$wavelength-399], lwd =3, col = "red")
})

output$power_reference = renderPlot({
  plot(data$wavelength, data$p_ref, type = "l", lwd = 3, col = "blue",
       xlab = "wavelength (nm)", ylab = expression(italic(P)[reference]), 
       main = paste0("Reference Power = ", pref()), ylim = c(0, 1))
  abline(v = data$wavelength[input$wavelength-399], lwd = 3, col = "red")
})

abs = reactive({
  noquote(sprintf("%.4f", data$abs[input$wavelength-399]))
})

trans = reactive({
  noquote(sprintf("%.4f", data$trans[input$wavelength-399]))
})

pref = reactive({
  noquote(sprintf("%.4f", data$p_ref[input$wavelength-399]))
})

psam = reactive({
  noquote(sprintf("%.4f", data$p_sam[input$wavelength-399]))
})

output$equation = renderText({
  paste0(abs(), " = \u2013log(", trans(), ") = \u2013log{(", psam(), ")/(", pref(), ")}")
})

})