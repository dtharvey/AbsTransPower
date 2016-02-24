# Introduction
This R Shiny app demonstrates the relationships central to Beer's law: *A* = -log*T* = -log{*P*_sample/*P*_reference} where *A* is absorbance, *T* is transmittance, *P*_sample is the source's power as passed by the sample, and *P*_reference is the source's power as passed by the sample. The four plots, which are arranged about the central equation so that each lies just above or just below it variable, show the spectra for the variables as a function of wavelength. Adjusting the slider changes the wavelength, which is highlighted by a vertical red line. Each variables value is displayed above its plot and in the second of the central equations. The slider can be adjusted manually or placed in animation mode by clicking the button labeled 'Run'.

You can launch the app by typing

    shiny::runGitHub("AbsTransPower","dtharvey")

in the console.
