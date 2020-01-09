n<-seq(1, 100, 1);
f1<-log(n);
f2<-n;
f3<-n*log(n);
f4<-n*n;
f5<-n*n*n;
f6<-2^n;

ym<-max(f3);

cairo_pdf("functions.pdf");
plot(n, f1, col="lightblue", type="l", lwd=6, xlab="Input, n", ylab="Time", ylim=c(0, ym));
points(n, f2, col="darkblue", lwd=6, type="l");
points(n, f3, col="grey", lwd=6, type="l");
points(n, f4, col="black", lwd=6, type="l");
points(n, f5, col="red", lwd=6, type="l");
points(n, f6, col="darkred", lwd=6, type="l");
grid(col="black");
legend("topright", c("log(n)", "n", "nlog(n)", expression(n^2), expression(n^3), expression(2^n)), col=c("lightblue", "darkblue", "grey", "black", "red", "darkred"), lwd=6, bty="n");
dev.off();
