library(dplyr)

# ------------------------  DATA EXPLORATION  --------------------------------#
data(starwars)
head(starwars)
mean(starwars$height)
mean(starwars$height, na.rm = TRUE)

# ---------------------  AGGREAGATION METHODS   -----------------------------#
aggregate(starwars$height,
          by = list(sex = starwars$sex),
          mean, na.rm=TRUE)

# other method by defining a function
starwars_no_nas <- subset(starwars,!is.na(height))

aggregate(starwars_no_nas$height,
          by = list(sex = starwars_no_nas$sex),
          mean)

aggregate(starwars_no_nas$height,
          by = list(Sex = starwars_no_nas$sex,
                    `Hair color` = starwars_no_nas$hair_color),
          mean)

mean(starwars$height, na.rm = TRUE)
with(starwars,
     mean(height, na.rm = TRUE)) # this syntax avoids $ everywhere.

# using |> and with() -> more concise code !
starwars |>
  subset(!is.na(sex)) |>
  with(aggregate(height,
                 by = list(Species = species,
                           Sex = sex),
                 mean))

# aggregate on two colulns using the same function
starwars |>
  with(aggregate(cbind(height, mass),
                 by = list(Sex = sex),
                 FUN = mean, na.rm = TRUE))

# --------------------  MORE ADVANCED OPERATIONS   ---------------------------#

# create a (fake) dataset
survey_data_base <- as.data.frame(
  tibble::tribble(
    ~id, ~var1, ~var2, ~var3,
    1, 1, 0.2, 0.3,
    2, 1.4, 1.9, 4.1,
    3, 0.1, 2.8, 8.9,
    4, 1.7, 1.9, 7.6
  )
)

# IMPORTANT:  is NOT suited to row-based workflows!
# Thus: reshape data
survey_data_long <- reshape(survey_data_base,
                            varying = list(2:4), v.names = "variable", direction = "long")

aggregate(survey_data_long$variable, 
          by=list(ID = survey_data_long$id),
          mean)

# END
