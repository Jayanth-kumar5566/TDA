#for 1
library("TDA")
file_list=list.files("./5/",pattern = "*.csv")
for (i in file_list){
  zz=paste("./5/",i,sep='')
  print(zz)
  X<-read.csv(zz)
  #summary(X)
  #Creating grid 
  by<-0.1
  margin_x<-seq(50,150,by=by)
  margin_y<-seq(50,150,by=by)
  #Grid=expand.grid(margin_x,margin_y)
  #plot(Grid)
  #DiagGrid<-gridDiag(X=X,FUN=distFct,lim=cbind(c(50,150),c(50,150)),by=by,maxdimension = 0,sublevel = FALSE,printProgress = TRUE)
  DiagGrid <- ripsDiag(X = X,1,20,
                       library = "GUDHI", location = TRUE, printProgress = FALSE)  
  jpeg(paste('persistance',i,'.jpg',sep=''))
  par(mfrow=c(1,2)) 
  plot(X,xlim=c(50,150),ylim=c(50,150))  #plot(DiagGrid[["diagram"]],main='L2 norm')
  i=dim(DiagGrid$diagram)[1]
  j=length(which(DiagGrid$diagram[1:i]==0))
  birth=DiagGrid$diagram[(i+1):(i+j)]
  death=DiagGrid$diagram[(2*i+1):(2*i+j)]
  plot(birth,death,'p',xlim=c(0,80),ylim = c(0,80),xlab="Birth",ylab = "Death")
  lines(0:80,0:80)
  dev.off()
}