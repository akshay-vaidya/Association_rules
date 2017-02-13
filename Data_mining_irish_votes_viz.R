Encoding(votes$First_name)="UTF-8"
Encoding(votes$Last_name)="UTF-8"
c<- do.call(paste, c(votes[c("First_name", "Last_name")], sep = ""))
c<-data.frame(c)
v<-votes[,-(1:3)]
tmp <- as.data.frame(t(v))
tmp <- 1*(tmp=="y")
colnames(tmp)<-c$c
votes_pol <- as(tmp,"transactions")
inspect(votes_pol)
itemFrequencyPlot(votes_pol,topN=75,type="relative")
fit<-apriori(votes_pol,parameter=list(support=0.3,confidence=0.8))
inspect(fit)

