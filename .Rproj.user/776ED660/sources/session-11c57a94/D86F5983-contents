# api.R
library(plumber)

source("model.R")  # où est stockée ta fonction et ton modèle chargé

#* @post /predict
#* @param temperature:double
#* @param humidite:double
#* @param force_moyenne_du_vecteur_de_vent:double
#* @param force_du_vecteur_de_vent_max:double
#* @param pluie_intensite_max:double
#* @param sismicite:double
#* @param concentration_gaz:double
#* @param pluie_totale:double
#* @param quartier:string
function(
    temperature,
    humidite,
    force_moyenne_du_vecteur_de_vent,
    force_du_vecteur_de_vent_max,
    pluie_intensite_max,
    sismicite,
    concentration_gaz,
    pluie_totale,
    quartier
) {
  new_raw <- data.frame(
    temperature,
    humidite,
    force_moyenne_du_vecteur_de_vent,
    force_du_vecteur_de_vent_max,
    pluie_intensite_max,
    sismicite,
    concentration_gaz,
    pluie_totale,
    quartier
  )
  
  proba <- predict_catastrophe_newline(
    new_raw,
    orig_df,
    df_model,
    final_model
  )
  
  return(proba)
}
