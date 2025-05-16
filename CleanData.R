library(stringr)
# Charger les données depuis un fichier CSV

donneesBrute <- read.csv("data/catastrophes_naturelles.csv")

# Afficher les premières lignes


head(donneesBrute)


# Résumé statistique
summary(donneesBrute)

# Structure du jeu de données
str(donneesBrute)


# On voit que des donnes ne sont pas bonnes
# Charger les données depuis un fichier CSV
donneesBrute <- read.csv("data/catastrophes_naturelles.csv")

DN <- donneesBrute
#DN for donneesNettoyeesa

# Identifier les indices des lignes qui NE SONT PAS "buguées"
# en utilisant la même condition et en la niant (!)
lignes_buguees_index <- which(!grepl("[0-9]{2,}", donneesBrute[, 10]))

# Afficher les indices des lignes non "buguées"
print("Indices des lignes non 'buguées' :")
print(lignes_buguees_index)

# Tu peux ensuite utiliser ces indices pour créer un nouveau data frame
donneeBuguees <- donneesBrute[lignes_buguees_index, ]


for (i in lignes_buguees_index) {
  valeur <- donneesBrute[i, "X"]
  ligne <- str_split(valeur, ",(?![^\\[]*\\])", simplify = TRUE)
  DN[i, ] <- ligne[1:12]
}

cols_to_convert <- setdiff(names(DN), c("date", "quartier","catastrophe"))
DN[cols_to_convert] <- lapply(DN[cols_to_convert], function(x) {
  if (is.factor(x) || is.character(x)) {
    as.numeric(as.character(x))
  } else {
    x
  }
})
#normalisation
DN[cols_to_convert] <- lapply(DN[cols_to_convert], function(x) {
  if (is.numeric(x)) {
    (x - min(x, na.rm = TRUE)) / (max(x, na.rm = TRUE) - min(x, na.rm = TRUE))
  } else {
    x
  }
})

DN$catastrophe <- gsub('^"|"$', '', DN$catastrophe)


# ───── PRÉPARATION DES DONNÉES ─────
DN$catastrophe_simple <- factor(
  ifelse(DN$catastrophe == "['innondation']", "innondation",
         ifelse(DN$catastrophe == "['innondation', 'seisme']", "innondation_seisme",
                ifelse(DN$catastrophe == "['seisme']", "seisme", "aucun")))
)



head(DN)
write.csv(DN,file='data/clean_data.csv', row.names=TRUE)
save(DN, file = "data/clean_data.RData")

