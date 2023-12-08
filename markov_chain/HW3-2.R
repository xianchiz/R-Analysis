library(MDPtoolbox)
P <- array(0, c(12,12,4))

# Inaccuracy level
p <- 0.1

# Up action - Transition matrix
# Action 1 (Up)
p_up= matrix(c(
  # State 1
  0,     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
  # State 2
  0,     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
  # State 3
  0,     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
  # State 4
  0,     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,     1,
  # State 5
  1-2*p, 0,     0,     0,     2*p,   0,     0,     0,     0,     0,     0,     0,
  # State 6
  0,     0,     1-2*p, 0,     0,     p,     p,     0,     0,     0,     0,     0,
  # State 7
  0,     0,     0,     1-2*p, 0,     p,     p,     0,     0,     0,     0,     0,
  # State 8
  0,     0,     0,     0, 1-2*p,     0,     0,     p,     p,     0,     0,     0,
  # State 9
  0,     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
  # State 10
  0,     0,     0,     0,     0, 1-2*p,     0,     0,     p,     0,     p,     0,
  # State 11
  0,     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,     1,
  # State 12 (Absorbing state)
  0,     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,     1
), 12, 12, byrow = TRUE)

# Right action - Transition matrix
p_right = matrix(c(
  # State 1
  p, 1-2*p,     0,     0,     p,     0,     0,     0,     0,     0,     0,     0,
  # State 2
  0,     2*p,1-2*p,    0,     0,     0,     0,     0,     0,     0,     0,     0,
  # State 3
  0,     0,     p, 1-2*p,     0,     p,     0,     0,     0,     0,     0,     0,
  # State 4
  0,     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,     1,
  # State 5
  0,     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
  # State 6
  0,     0,     p,     0,     0,     0, 1-2*p,     0,     0,     p,     0,     0,
  # State 7
  0,     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
  # State 8
  0,     0,     0,     0,     p,     0,     0,     p, 1-2*p,     0,     0,     0,
  # State 9
  0,     0,     0,     0,     0,     0,     0,     0,     2*p,1-2*p,    0,     0,
  # State 10
  0,     0,     0,     0,     0,     p,     0,     0,     0,     p, 1-2*p,     0,
  # State 11
  0,     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,     1,
  # State 12 (Absorbing state)
  0,     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,     1
), 12, 12, byrow = TRUE)

# Down action - Transition matrix
p_down= matrix(c(
  # State 1
  p,     p,     0,     0,     1-2*p, 0,     0,     0,     0,     0,     0,     0,
  # State 2
  0,     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
  # State 3
  0,     p,     0,     p,     0, 1-2*p,     0,     0,     0,     0,     0,     0,
  # State 4
  0,     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,     1,
  # State 5
  0,     0,     0,     0,     2*p,   0,     0,  1-2*p,    0,     0,     0,     0,
  # State 6
  0,     0,     0,     0,     0,     p,     p,     0,     0,     1-2*p, 0,     0,
  # State 7
  0,     0,     0,     0,     0,     p,     p,     0,     0,     0,     1-2*p, 0,
  # State 8
  0,     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
  # State 9
  0,     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
  # State 10
  0,     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
  # State 11
  0,     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,     1,
  # State 12 (Absorbing state)
  0,     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,     1
), 12, 12, byrow = TRUE)

# Left action - Transition matrix
p_left =matrix(c(
  # State 1
  0,     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
  # State 2
  1-2*p, 2*p  , 0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
  # State 3
  0,     1-2*p, p,     0,     0,     p,     0,     0,     0,     0,     0,     0,
  # State 4
  0,     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,     1,
  # State 5
  0,     0,     0,     0,     1,     0,     0,     0,     0,     0,     0,     0,
  # State 6
  0,     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
  # State 7
  0,     0,     0,     p,     0,     0,     1-2*p, 0,     0,     0,     p,     0,
  # State 8
  0,     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
  # State 9
  0,     0,     0,     0,     0,     0,     0,     1-2*p, 2*p,   0,     0,     0,
  # State 10
  0,     0,     0,     0,     0,     p,     0,     0,     1-2*p, p,     0,     0,
  # State 11
  0,     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,     1,
  # State 12 (Absorbing state)
  0,     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,     1
), 12, 12, byrow = TRUE)
Actions=list(up=p_up, right=p_right,down=p_down, left=p_left)

# Define the reward matrix
Rewards <- matrix(c(
  #State 1
  -1, -1, -1, -1,
  # State 2
  -1, -1, -1, -1,
  # State 3
  -1, -1, -1, -1, 
  # State 4 (Green cell)
  100, 100, 100, 100, 
  # State 5
  -1, -1, -1, -1,
  # State 6
  -1, -1, -1, -1, 
  # State 7
  -1, -1, -1, -1,
  # State 8
  -1, -1, -1, -1,
  # State 9
  -1, -1, -1, -1,
  # State 10
  -1, -1, -1, -1, 
  # State 11 (Orange cell)
  -100, -100, -100, -100,
  # State 12 (Absorbing state)
  0, 0, 0, 0
), 12, 4, byrow = TRUE)



#3. Solving the navigation
solver= mdp_value_iteration(P=Actions, R=Rewards, discount = 0.99)
print(solver$policy) 
print(names(Actions)[solver$policy]) 
print(solver$V) 
print(solver$iter) 
#7. Additional information: Time taken. This time can be different in each run
print(solver$time)
