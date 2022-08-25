library(deaR)

#Personal Consumer Credit Loans
data <- read.csv('test500-158B-320G.csv')

data_basic <- read_data(data,
                        dmus = 1,
                        inputs = 2:6,
                        outputs = 7:8)

result_data <- model_basic(data_basic,
                           orientation = 'io',
                           rts = 'crs')
summary(result_data)

score <- read.csv('score-test500-320G.csv')
score <- unlist(score)
hist(score, xlab = 'DEA Score', ylab = 'Number of Applicants', 
     labels = TRUE, ylim = c(0,340), breaks = 10, main=NULL)
