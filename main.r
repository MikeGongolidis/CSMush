main<-tabItem(tabName = "main",
      fluidPage(
        h3("Header and some photos",align="center"),
        fluidRow(
          box(width = 3,
            selectInput("capshape", "Cap-shape:",
                         c("Bell" = "b",
                           "Conical" = "x",
                           "Flat" = "f",
                           "Knobbed" = "k",
                            "Sunken" = "s"))
          ),
          box(width = 3,
            selectInput("capsurface", "Cap-surface:",
                         c("Fibrous" = "f",
                           "Grooves" = "g",
                           "Scaly" = "y",
                           "Smooth" = "s"))
          ),
          box(width = 3,
            selectInput("capcolor", "Cap-color:",
                        c("Brown" = "n",
                          "buff" = "b",
                          "cinnamon" = "c",
                          "gray" = "g",
                          "green" = "r",
                          "pink" = "p",
                          "purple" = "u",
                          "red" = "e",
                          "white" = "w",
                          "yellow" = "y"))
          ),
          box(width = 3,
            selectInput("bruises", "Bruises:",
                        c("bruises" = "t",
                          "No" = "f"))
          )
        ),
        fluidRow(
          box(width = 3,status = "warning",
            selectInput("odor", "Odor:",
                        c("almond" = "a",
                          "anise" = "l",
                          "creosote" = "c",
                          "fishy" = "y",
                          "foul" = "f",
                          "musty" = "m",
                          "none" = "n",
                          "pungent" = "p",
                          "spicy" = "s"))
          ),
          box(width = 3,
            selectInput("gillattachment", "Gill-attachment:",
                        c("attached" = "a",
                          "descending" = "d",
                          "free" = "f",
                          "noched" = "n"))
          ),
          box(width = 3,
            selectInput("gillspacing", "Gill-spacing:",
                        c("close" = "c",
                          "crowded" = "w",
                          "distant" = "d"))
          ),
          box(width = 3,
              selectInput("gillsize", "Gill-size:",
                          c("broad" = "b",
                            "narrow" = "n"))
          )
        ),
        fluidRow(
          box(width = 3,status = "warning",
              selectInput("gillcolor", "Gill-color:",
                          c("black" = "k",
                            "brown" = "n",
                            "buff" = "b",
                            "chocolate" = "h",
                            "gray" = "g",
                            "orange" = "o",
                            "green" = "r",
                            "pink" = "p",
                            "purple" = "u",
                            "red" = "e",
                            "white" = "w",
                            "yellow" = "y")
                            )
          ),
          box(width = 3,
              selectInput("stalkshape", "Stalk-shape:",
                          c("enlarging" = "e",
                            "tapering" = "t")
                            )
            
          ),
          box(width = 3,
              selectInput("stalkroot", "Stalk-root:",
                          c("bulbous" = "b",
                            "club" = "c",
                            "cup" = "u",
                            "equal" = "e",
                            "rhizomorphs" = "z",
                            "rooted"="r")
                            )
            
          ),
          box(width = 3,
              selectInput("stalksar", "Stalk-surface-above-ring:",
                          c("fibrus" = "f",
                            "scaly" = "y",
                            "silky" = "k",
                            "smooth" = "s"
                            )
                          )
            
          )
        ),
        fluidRow(
          box(width = 3,
              selectInput("stalksbr", "Stalk-surface-below-ring:",
                          c("fibrus" = "f",
                            "scaly" = "y",
                            "silky" = "k",
                            "smooth" = "s"
                          )
                          )
            
          ),
          box(width = 3,
              selectInput("stalkcar", "Stalk-color-above-ring:",
                          c(
                            "brown" = "n",
                            "buff" = "b",
                            "cinnamon" = "c",
                            "gray" = "g",
                            "orange" = "o",
                            "pink" = "p",
                            "red" = "e",
                            "white" = "w",
                            "yellow" = "y")
                          )
            
          ),
          box(width = 3,
              selectInput("stalkcbr", "Stalk-color-below-ring:",
                          c(
                            "brown" = "n",
                            "buff" = "b",
                            "cinnamon" = "c",
                            "gray" = "g",
                            "orange" = "o",
                            "pink" = "p",
                            "red" = "e",
                            "white" = "w",
                            "yellow" = "y")
                          )
            
          ),
          box(width = 3,
              selectInput("veiltype", "veil-type:",
                          c("partial" = "p",
                            "universal" = "u"
                            )
                          )
            
          )
        ),
        fluidRow(
          box(width = 3,
              selectInput("veilcolor", "veil-color:",
                          c(
                            "brown" = "n",
                            "orange" = "o",
                            "white" = "w",
                            "yellow" = "y")
                          )
            
          ),
          box(width = 3,
              selectInput("ringnumber", "ring-number:",
                          c(
                            "none" = "n",
                            "one" = "o",
                            "two" = "t"
                            ))
            
          ),
          box(width = 3,status = "warning",
              selectInput("ringtype", "ring-type:",
                          c(
                            "cobwebby" = "c",
                            "evanescent" = "e",
                            "flaring" = "f",
                            "large" = "l",
                            "none" = "n",
                            "pendant" = "p",
                            "sheathing" = "s",
                            "zone" = "z"
                          ))
            
          ),
          box(width = 3,status = "warning",
              selectInput("sporeprintcolor", "spore-print-color:",
                          c( "black" = "k",
                            "brown" = "n",
                            "buff" = "b",
                            "chocolate" = "h",
                            "green" = "r",
                            "orange" = "o",
                            "purple" = "u",
                            "white" = "w",
                            "yellow" = "y"
                          ))
            
          ),
          fluidPage(
          box(width = 3,
              selectInput("population", "population:",
                          c( "abundant" = "a",
                             "cluster" = "c",
                             "numerous" = "n",
                             "scattered" = "s",
                             "several" = "v",
                             "solitary" = "y"
                             
                          ))
            
          ),
          box(width = 3,
              selectInput("habitat", "habitat:",
                          c( "grasses" = "g",
                             "leaves" = "l",
                             "meadows" = "m",
                             "paths" = "p",
                             "urban" = "u",
                             "waste" = "w",
                             "woods" = "d"
                          )
                          )
            
            ),
            box(width = 3,
                actionButton("do", "Go check !")
              
            ),
            box(width = 3,
                verbatimTextOutput("summary")
          )
        )
    )
  )
)
