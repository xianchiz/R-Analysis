# Installing and loading the package
# install.packages("MDPtoolbox")

library(MDPtoolbox)


# 1. Defining the Set of Actions
A_withoutm=matrix(c( 0.35, 0.65,
          0.5, 0.5),
          nrow=2,ncol=2,byrow=TRUE)

A_maintenance=matrix(c(0.6, 0.4,
          0.5, 0.5),
          nrow=2,ncol=2,byrow=TRUE)

A_repair=matrix(c( 0.5, 0.5,
          0.6, 0.4),  
          nrow=2,ncol=2,byrow=TRUE)
A_replace=matrix(c( 0.5, 0.5,
                   1, 0),  
                nrow=2,ncol=2,byrow=TRUE)

#Combined Actions matrix
Actions=list(without_maintenance=A_withoutm,maintenance=A_maintenance,repair=A_repair,replace=A_replace)

#2. Defining the rewards and penalties

R_withoutm=matrix(c(100, 0,
              -999, -999),
              nrow=2,ncol=2,byrow=TRUE)
R_maintenance=matrix(c(70, -30,
                -999, -999),
              nrow=2,ncol=2,byrow=TRUE)

R_repair=matrix(c( -999, -999,
                     40, -60),  
                  nrow=2,ncol=2,byrow=TRUE)
R_replace=matrix(c(-999, -999,
                -10, -999),
              nrow=2,ncol=2,byrow=TRUE)

Rewards=list(R_withoutm,R_maintenance,R_repair,R_replace )

#3. Solving the navigation
solver=mdp_finite_horizon(P=Actions, R=Rewards,discount = 1,N = 20)
#solver=mdp_value_iteration(P=Actions, R=Rewards, discount = 0.9, epsilon = 0.0001)

#4. Getting the policy # 2,4,1,3
print(solver$policy) 
print(names(Actions)[solver$policy]) 

#5. Getting the Values at each step
print(solver$V) 

#6. Additional information: Number of iterations
print(solver$iter) ## null

#7. Additional information: Time taken. This time can be different in each run
print(solver$time) #Time difference of 0.004698038 secs