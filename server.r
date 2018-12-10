server <- function(input, output) {
  shroomTemp <- eventReactive(input$do, {
    data.frame(input$capshape,input$capsurface,input$capcolor,input$bruises,input$odor,input$gillattachment,input$gillspacing,
      input$gillsize,input$gillcolor,input$stalkshape,input$stalkroot,input$stalksar,input$stalksbr,input$stalkcar,
      input$stalkcbr,input$veiltype,input$veilcolor,input$ringnumber,input$ringtype,input$sporeprintcolor,input$population,input$habitat)
  })
  
  output$summary <- renderPrint({
    shroom <- as.data.frame(shroomTemp())
    names(shroom) <- names
    
    predict(mod3,shroom)
    #shroom
  })
}  