#for 1
library("TDA")
file_list=list.files("./1/Rips_daig/",pattern = "*.csv")
for (i in file_list){
  zz=paste("./1/Rips_daig/",i,sep='')
  print(zz)
  X<-read.csv(zz)
  #summary(X)
  #Creating grid 
  by<-0.1
  margin_x<-seq(0,16,by=by)
  margin_y<-seq(0,16,by=by)
  #Grid=expand.grid(margin_x,margin_y)
  #plot(Grid)
  #DiagGrid<-gridDiag(X=X,FUN=distFct,lim=cbind(c(0,16),c(0,16)),by=by,maxdimension=0,sublevel = FALSE,printProgress = TRUE)
  DiagGrid <- ripsDiag(X = X,1,20,
                       library = "GUDHI", location = TRUE, printProgress = TRUE)
  jpeg(paste('persistance',i,'.jpg',sep=''))
  par(mfrow=c(1,2)) 
  plot(X,xlim=c(0,16),ylim=c(0,16))
  #plot(DiagGrid[["diagram"]],main='L2 norm')
  i=dim(DiagGrid$diagram)[1]
  j=length(which(DiagGrid$diagram[1:i]==0))
  birth=DiagGrid$diagram[(i+1):(i+j)]
  death=DiagGrid$diagram[(2*i+1):(2*i+j)]
  plot(birth,death,'p',xlim=c(0,25),ylim = c(0,25),xlab="Birth",ylab = "Death")
  lines(0:25,0:25)
  dev.off()
}

