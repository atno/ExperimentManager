# sampleScript.R

library(ggplot2)

# load sample data from the ExperimentManager package
train <- read.csv("../data/sampleTrain.csv", header=TRUE )



# plot density
p <- qplot( hits, data=train, geom=c("density"), color=types)
print(p)

# save plot
ggsave(filename="plot01.png", plot=p)



