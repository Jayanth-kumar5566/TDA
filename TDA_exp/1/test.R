library("TDA")
X<-read.csv("5/data6.csv")
X=X[1:2,]
summary(X)
#Creating grid 
by<-0.1
margin_x<-seq(0,200,by=by)
margin_y<-seq(1,20,by=by)
Grid=expand.grid(margin_x,margin_y)
#plot(Grid)
distance <- distFct(X = X, Grid = Grid)
persp(margin_x, margin_y,matrix(distance, ncol = length(margin_y), nrow = length(margin_x)), xlab = "",
      ylab = "", zlab = "", theta = -20, phi = 35, ltheta = 50,
      col = 2, border = NA, main = "KDE", d = 0.5, scale = FALSE,
      expand = 3, shade = 0.9)
DiagRips <- ripsDiag(X = X,1,20,
                     library = "GUDHI", location = TRUE, printProgress = FALSE)
DiagGrid<-gridDiag(X=X,FUN=distFct,lim=cbind(c(1,20),c(1,20)),by=by,
                   maxdimension = 0,sublevel = FALSE,printProgress = TRUE)
#jpeg('persistance.jpg')
par(mfrow=c(1,2)) 
plot(X,xlim=c(1,20),ylim=c(1,20))
plot(DiagGrid[["diagram"]],main='L2 norm',barcode = TRUE)
plot(DiagRips[["diagram"]],main='L2 norm')
DiagGrid=DiagRips
i=dim(DiagGrid$diagram)[1]
j=length(which(DiagGrid$diagram[1:i]==0))
birth=DiagGrid$diagram[(i+1):(i+j)]
death=DiagGrid$diagram[(2*i+1):(2*i+j)]
plot(birth,death,'p',xlim=c(0,25),ylim = c(0,25))
lines(0:15,0:15)
#dev.off()

