#this is code for testing and getting started with SparkR

#SparkR requires the R package rJava
install.packages("rJava")
library(rJava)


#install the package
library(devtools)
install_github("amplab-extras/SparkR-pkg", subdir="pkg")
library(sparkR)

#run a local Spark master
sc <- sparkR.init(master="local")

#read an input file from HDFS and process every line using lapply on a RDD
sc <- sparkR.init("local")
lines <- textFile(sc, "hdfs://data.txt")
wordsPerLine <- lapply(lines, function(line) { length(unlist(strsplit(line, " "))) })