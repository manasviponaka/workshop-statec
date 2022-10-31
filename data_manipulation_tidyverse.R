library(dplyr)

# --------------------- OPERATIONS FROM THE TIDYVERSE ----------------------- #
16 %>% sqrt
`+`(2, 12)
16 %>%
  sqrt %>%
  log

16 %>% sqrt %>% `+`(18)
16 |> sqrt() |> `+`(x = _, 18)# squareroot
