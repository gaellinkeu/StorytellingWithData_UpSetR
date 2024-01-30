data <- read.csv('spotify_popular_genre.csv', sep=';')
data2 <- data[,-1]
data2[data2 != 0] <- 1
data2

firstup <- function(x) {
  substr(x, 1, 1) <- toupper(substr(x, 1, 1))
  x
}
names(data2) <- firstup(gsub("\\."," ",names(data2)))
library(UpSetR)
upset(data2[,1:10],order.by="freq", main.bar.color = "#1EA765")
sets = c("Dance pop","Modern rock","Alternative metal","Pop","Neo mellow")
png(file="Most popular music genre 2020-2019")
upset(data2, sets=rev(sets), keep.order=TRUE, order.by="freq",main.bar.color="#1EA765", shade.alpha=0.6, matrix.dot.alpha=0.3, matrix.color="#1EA765", sets.bar.color="gray50",line.size=0.5, mainbar.y.label="Music Genre Intersection Size")
dev.off()