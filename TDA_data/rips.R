library("TDA")
X<-read.csv("data_reshaped.csv")
X$GSH=(X$GSH-mean(X$GSH))/sqrt(var(X$GSH))
X$HbA1c=(X$HbA1c-mean(X$HbA1c))/sqrt(var(X$HbA1c))
plot(X$GSH,X$HbA1c,col=X$Patient.Status,main="Red Diabetic, Black Healthy")
Y=X[,c("GSH","HbA1c")]
DiagGrid <- ripsDiag(X = Y,1,1.5,
                     library = "GUDHI", location = TRUE, printProgress = TRUE) 
plot(DiagGrid[["diagram"]],main='L2 norm')
