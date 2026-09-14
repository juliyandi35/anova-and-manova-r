library(haven)
Dataset <- read_sav("Data.sav")
str(Dataset)

Dataset <- data.frame(Dataset)

Min_max <- function(x){
  (x-min(x))/(max(x)-min(x))
}

#for (i in 1:(ncol(Dataset)-1)) {
#  Dataset[,i] <- scale(Dataset[,i])
#}

for (i in 1:(ncol(Dataset)-5)) {
  Dataset[,i] <- log(Dataset[,i])
}

for (i in (ncol(Dataset)-4):(ncol(Dataset)-1)) {
  Dataset[,i] <- Min_max(Dataset[,i])
}

write_sav(Dataset,"Data Norm 5.sav")

