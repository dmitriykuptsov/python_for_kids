factorial <- function(n) {
	acc = 1;
	if(n==0) {
		return(1);
	}
	for(i in seq(1, n)) {
		acc <- acc * i;
	}
	return(acc);
}

coef <-function(n, k) {
	return(factorial(n)/(factorial(n-k)*factorial(k)))
}

geometric_distribution <- function(p, n) {
	probs <- c();
	for(i in seq(1, n)) {
		probs <- append(probs, p*(1-p)^(i-1));
	}
	return(probs);
}

binomial_distribution <- function(p, n) {
	probs <- c();
	for(i in seq(0, n)) {
		probs <- append(probs, coef(n, i)*p^(i)*(1-p)^(n-i));
	}
	return(probs);
}

cairo_pdf("distributions.pdf");
data<-binomial_distribution(0.3, 10);
par(mfrow=c(2,1));
plot(seq(0, 10), data, col="darkred", type="l", lwd=6, xlab="Number of successes", ylab="Probability", xlim=c(0, 10));
grid(col="black");
data<-geometric_distribution(0.3, 10);
plot(seq(1, 10), data, col="blue", type="l", lwd=6, xlab="Number of trials before success", ylab="Probability", xlim=c(0, 10));
grid(col="black");
dev.off();
