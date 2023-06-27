
install.packages("janitor",verbose = F, quiet = T)
install.packages('dplyr',verbose = F, quiet = T) 
install.packages('tidyr',verbose = F, quiet = T) 
require(janitor)
require(dplyr)
require(tidyr)

datos <- readr::read_csv(url("https://raw.githubusercontent.com/Adrimgedu/test/main/HDHI%20Admission%20data.csv"))

datos$GENDER <- factor(datos$GENDER)
datos$RURAL <- factor(datos$RURAL)
datos$`TYPE OF ADMISSION-EMERGENCY/OPD` = factor(datos$`TYPE OF ADMISSION-EMERGENCY/OPD`)
datos$OUTCOME <- factor(datos$OUTCOME)

datos <- dplyr::sample_n(datos,size = 600)
datos <- janitor::clean_names(datos)

datos <- dplyr::select(.data = datos,sno,mrd_no,d_o_a,d_o_d,age,gender,rural,type_of_admission_emergency_opd,duration_of_stay,outcome,smoking,alcohol,hb,tlc,urea,creatinine,anaemia,heart_failure,pulmonary_embolism,chest_infection)
datos <- tidyr::drop_na(datos) #Añado nombre.
