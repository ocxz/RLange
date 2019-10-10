m=read.table("RIMD.diversity.stat");
pdf("mytest.pdf",width=7,height=8);
library(Hmisc);

layout(matrix(c(1:3,0,4,0),3,2 ),c(2,1),c(1,2,1));

x=m[,2];
y=m[,3];
yhist=hist(y,nclass=50,plot=FALSE);
z=m[,1];
zhist=hist(z,nclass=50,plot=FALSE);

xmean=mean(x); xsd=sd(x);
ymean=mean(y); ysd=sd(y);
zmean=mean(z); zsd=sd(z);

xlima=floor(min(c(x,y)) );
xlimb=ceiling(max(c(x,y)) );
zlima=floor(min(z));
zlimb=ceiling(max(z));

opar=par();
par(cex.axis=2,font.axis=2);

par(mar=c(2,4,2,1));
hist(x,nclass=50,col="red",xlim=c(xlima,xlimb),yaxt="n",
    xlab=NA,ylab=NA,main=NA);
axis(2,at=c(0,400,800));
mgp.axis(2,at=c(200,600),labels=FALSE);
#minor.tick(nx=1,ny=2);

par(mar=c(2,4,1,1));
plot(x,z,type="p",pch=".",col="red",
    xlim=c(xlima,xlimb),ylim=c(zlima,zlimb),yaxt="n",
    xlab=NA,ylab=NA,main=NA);
axis(2,at=c( seq(-10,20,10) ),labels=c( seq(-10,20,10)/1000 ) );
mgp.axis(2,at=c( seq(-5,15,10) ),labels=FALSE,las=2);

points(y,z,pch=".",col="blue");

par(lty=2,lwd=2);
abline(h=c(zmean+3*zsd,zmean-3*zsd),col="purple");
lines(c(xmean+3*ysd,xmean+3*ysd),c(zmean+3*zsd,zlimb+1),col="red");
lines(c(ymean-3*ysd,ymean-3*ysd),c(zmean+3*zsd,zlimb+1),col="blue");
lines(c(xmean-3*xsd,xmean-3*xsd),c(zmean-3*zsd,zlima-1),col="red");
lines(c(ymean+3*xsd,ymean+3*xsd),c(zmean-3*zsd,zlima-1),col="blue");

#text(c(1,-4,1.8,-5.0),c(15,15,-10,-10),
#    labels=c("¢ñ","¢ò","¢ó","¢ô"),
##    labels=c("I","II","III","IV"),family="Times",
#    cex=2,font=2);
##text(c(1, c(-4,-4.1), seq(1.7,1.9,0.1), c(-5.1,-4.92) ), c(15,15,15,rep(-10,3),c(-10,-10) ),
###    labels=c("¢ñ","¢ò","¢ó","¢ô"),
##    labels=c("I",rep("I",2),rep("I",3),"I","V"),family="Times",
##    cex=2,font=2);

par(lty=1,lwd=1);

par(mar=c(2,4,1,1));
top=ceiling(max(yhist$counts) );
bottom=floor( min(yhist$counts) );
hist(y,nclass=50,xlim=c(xlima,xlimb),col="blue",ylim=c(top,bottom),
    xaxt="n",yaxt="n",
    xlab=NA,ylab=NA,main=NA);
axis(2,c(0,400,800) );
mgp.axis(2,c(200,600),labels=FALSE);
axis(3,c( seq(-4,2,2) ));

par(mar=c(2,3,1,1));
barplot(zhist$counts,horiz=T,width=(zlimb-zlima)/length(zhist$counts),
    space=0,col="purple",ylim=c(0,zlimb-zlima),xaxt="n",
    xlab=NA,ylab=NA,main=NA);
axis(2,c(seq(2,32,10) ), labels=as.character.Date(c(seq(-10,20,10)/1000 ) ) );
mgp.axis(2,c(seq(7,27,10) ),labels=FALSE);
axis(1,c(0,500,1000) );
mgp.axis(1,c(250,750),labels=F);

dev.off();

