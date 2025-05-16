load("~/Documents/48h/R project/AnalyseData/data/clean_data.RData")

library(dplyr)
library(ggplot2)
library(lubridate)
library(corrplot)


names(DN)

# On filtre les lignes où catastrophe == "seisme"
aucun_df <- DN[DN$catastrophe == "aucun", ]
seisme_df <- DN[DN$catastrophe == "['seisme']", ]
seisme_and_innondation_df <- DN[DN$catastrophe == "['innondation', 'seisme']", ]
innondation_df <- DN[DN$catastrophe == "['innondation']", ]


df<-DN
# Supposons que ton data frame s'appelle df

# Conversion date en format Date


df$pluie_totale <- as.numeric(as.character(df$pluie_totale))

mean(df$pluie_totale, na.rm = TRUE)
median(df$pluie_totale, na.rm = TRUE)

innondation_df$pluie_totale <- as.numeric(as.character(innondation_df$pluie_totale))

mean(innondation_df$pluie_totale, na.rm = TRUE)
median(innondation_df$pluie_totale, na.rm = TRUE)

#SEISME
resultat <- df %>% filter(sismicite > 0.60, quartier %in% c( "Zone 2", "Zone 3"))

# RSULTA AUCUN SEISME EN DESSOUS DE 0.60 de SISMICITE


resultat <- df %>% filter(pluie_totale > 600,force_du_vecteur_de_vent_max > 15, ,  quartier %in% c( "Zone 2", "Zone 4"))



# Filtrer pour garder seulement les lignes où catastrophe = "['inondation']"




ggplot(innondation_df, aes(x = pluie_totale, y = pluie_intensite_max,
                          color = temperature, size = humidite)) +
  geom_point(alpha = 0.7) +
  scale_color_viridis_c() +
  labs(title = "Inondations : Pluie Totale, Intensité Max, Température (couleur), Humidité (taille)",
       x = "Pluie Totale",
       y = "Pluie Intensité Max") +
  theme_minimal()


ggplot(seisme_df, aes(x = temperature, y = sismicite,
                            color = concentration_gaz, size = force_du_vecteur_de_vent_max)) +
  geom_point(alpha = 0.7) +
  scale_color_viridis_c() +
  labs(title = "Séismes : Sismicité selon Température, Concentration Gaz (couleur), Force Vent Max (taille)",
       x = "Température",
       y = "Sismicité") +
  theme_minimal()


ggplot(seisme_and_innondation_df, aes(x = pluie_totale, y = pluie_intensite_max,
                           color = temperature, size = humidite)) +
  geom_point(alpha = 0.7) +
  scale_color_viridis_c() +
  labs(title = "Inondations : Pluie Totale, Intensité Max, Température (couleur), Humidité (taille)",
       x = "Pluie Totale",
       y = "Pluie Intensité Max") +
  theme_minimal()


ggplot(seisme_and_innondation_df, aes(x = temperature, y = sismicite,
                      color = concentration_gaz, size = force_du_vecteur_de_vent_max)) +
  geom_point(alpha = 0.7) +
  scale_color_viridis_c() +
  labs(title = "Séismes : Sismicité selon Température, Concentration Gaz (couleur), Force Vent Max (taille)",
       x = "Température",
       y = "Sismicité") +
  theme_minimal()


