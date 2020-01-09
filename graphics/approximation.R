#x<-seq(1, 1000, 1);
n<-1000;
y1<-c();
y2<-c();
x1<-c();
for (i in seq(2, n)) {
	sum <- 0;
	for (j in seq(1, i - 1)) {
		sum<-sum+(i)/(i-j)
	}
	x1[i]<-i;
	y1[i]<-sum;
	y2[i]<-i*log(i);
}

cairo_pdf("approximation.pdf");
plot(x1, y1, type="l", lwd=6, col="darkblue", main="", xlab="Input size, n", ylab="Time, T(n)");
points(x1, y2, type="l", lwd=6, col="darkred");
grid(col="black");
legend("topright", c("Actual sum", "Appoximation"), col=c("darkblue", "darkred"), lwd=6, bty="n");
dev.off();