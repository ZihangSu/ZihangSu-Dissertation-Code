library(deaR)
library(MASS)

#Business Loans
data1 <- read.csv('test83.csv')

data_basic1 <- read_data(data1,
                        dmus = 1,
                        inputs = 2:4,
                        outputs = 5:7)

result_data1 <- model_basic(data_basic1,
                           orientation = 'io',
                           rts = 'crs')
summary(result_data1)

#Plot
score1 <- read.csv('score-test83.csv')
score1 <- unlist(score1)
hist(score1,xlab = 'DEA Score',ylab = 'Number of Firms', 
     labels = TRUE,ylim = c(0,15),breaks = 15,main = NULL,xaxt ='n')
axis(1,c(0,10,20,30,40,50,60,70,80,90,100),c(0,10,20,30,40,50,60,70,80,90,100))

#RA
DEAscore <- read.csv('score-DEA78.csv')
head(DEAscore)

fit <- lm(DEA~FE+SL+CS+CA+CR+IC,data=DEAscore)
summary(fit)

pre <- read.csv('DEA78.csv')
fitted_score <- predict(fit,pre)

plot(-20:100,-20:100,type='n',xlab = 'Observations',ylab = 'DEA Scores')

points(score1,col = "black",main = NULL,pch = 16)
points(fitted_score,main = NULL,pch = 21)
legend('bottomright',c('Original DEA scores','Fitted DEA Scores'),
       pch=c(16,21),cex=0.6)

#DA
median(score1)
mean(score1)

DA_data <- read.csv('DA-test83.csv')
head(DA_data)

DA <- lda(Z~FE+SL+CS+CA+CR+IC,data=DA_data)
DA

table(DA_data$Z,predict(DA)$class)


















