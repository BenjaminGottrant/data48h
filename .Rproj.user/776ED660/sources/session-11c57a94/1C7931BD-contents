load("~/Documents/48h/R project/AnalyseData/data/clean_data.RData")

get_catastrophe <- function(DN, zone, date) {
  # Filtrer le dataframe pour la zone et la date données
  subset_data <- DN[DN$quartier == zone & DN$date == date, ]
  
  # Vérifier si on a trouvé un résultat
  if (nrow(subset_data) == 0) {
    return(NA)  # Ou un message d'erreur comme "Pas de donnée pour cette zone/date"
  }
  
  # Retourner la catastrophe associée
  return(subset_data$catastrophe)
}

catastrophe <- get_catastrophe(DN, "Zone 2", "2171-02-01")
print(catastrophe)
