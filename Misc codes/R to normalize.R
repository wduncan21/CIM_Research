test<-read.table("G:\\OneDrive\\experiments\\DoD early BC sample\\DOD QC\\good DoD cross wafer raw for r",sep='	',header=TRUE)
new<-test[-1]
median<-apply(new,2,median)
norm<-sweep(new,2,median,"/")
norm<-round(norm,digits=5)
final<-cbind(test[1],norm)

write.table(final,"G:\\OneDrive\\experiments\\DoD early BC sample\\DOD QC\\good DoD cross wafer normalized",quote=F,row.names = FALSE,sep='	')

tfinal<-t(final)
ttfinal>setkey(ttfinal, a)
ttfinal <- ttfinal[,lapply(.SD,mean), by=a]