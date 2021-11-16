### Introduction to Biocomputing — Exercise 8 — Matthew Doktorczyk

## Question 1

# load in data from basketball game
bball<-read.table("UWvMSU_1-22-13.txt", header=TRUE)

# cumulative scores matrix
scores<-matrix(ncol=2, nrow=50, dimnames=list(c(1:50), c("UW", "MSU")))

# for loop / if/else statements
for(i in 1:nrow(bball)){
  if(bball[i,2]=="UW"){
    if(i>1){
      scores[i,1]=bball[i,3]+scores[(i-1),1]
      scores[i,2]=scores[(i-1),2]
    }else{
      scores[i,1]=bball[i,3]+0
      scores[i,2]=0
    }
    
  }else{
    if(i>1){
      scores[i,2]=bball[i,3]+scores[(i-1),2]
      scores[i,1]=scores[(i-1),1]
    }else{
      scores[i,2]=bball[i,3]+0
      scores[i,1]=0
    }
    
  }
}

# plot scores and time on graph
plot(x=bball$time, y=scores[,1], type='l')
lines(scores[,2])

#################################################

## Question 2 --- CURRENT ISSUE: NEED FOR LOOP TO DO IT 10 TIMES

# get user input
user_guess <- readline(prompt = "Choose a number between 1 & 100: ")

# have computer generate random number
right_number=sample(1:100, 1)

# if else statements
for(i in 1:10){
  user_guess <- readline(prompt = "Choose a number between 1 & 100: ")  
if(user_guess > right_number){
  print("Too high!")
}else if(user_guess < right_number){
    print("Too low!")
}else{
  print("You're right!")
  }
}
