#------------------------------------------------
#
#  Global variables for Shiny Application
#    - source CSV dataset
#
#------------------------------------------------
df_states <- read.csv(file="./State_Under_65_Lite.csv", head=TRUE, sep=",")
colnames(df_states) <- c("STATE","AMB_USERS","AMB_RATE","AMB_EVENTS_PER_K","READMITS","READMIT_RATE","ER_VISITS","ER_VISITS_PER_K")
