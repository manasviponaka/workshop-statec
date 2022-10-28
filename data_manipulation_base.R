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
