# Recitation 9 - Hospital OR Scheduling
# Nikita Korolko - April 2015


# Install and load the lpSolveAPI package:

#install.packages("lpSolveAPI")
library(lpSolveAPI)


# The formulation that we want to construct can be found in OR_schedule.lp file in the Recitation 9 folder


# Create a model, specifying (1) number of constraints and (2) number of decision variables:

OR_schedule = make.lp(95,25)


# Let's give names to our variables and constraints (not necessary, but makes it a little easier)

VariableNames = c("xOP_1", "xOP_2", "xOP_3","xOP_4","xOP_5", "xGY_1","xGY_2","xGY_3","xGY_4","xGY_5", "xOS_1","xOS_2","xOS_3","xOS_4","xOS_5", "xOT_1","xOT_2","xOT_3","xOT_4","xOT_5", "xGS_1","xGS_2","xGS_3","xGS_4","xGS_5")

ConstraintNames = c("TotalOR_1", "TotalOR_2", "TotalOR_3", "TotalOR_4", "TotalOR_5", "Teams_OP_1","Teams_OP_2","Teams_OP_3","Teams_OP_4","Teams_OP_5",
    "Teams_GY_1", "Teams_GY_2","Teams_GY_3","Teams_GY_4","Teams_GY_5",
    "Teams_OS_1","Teams_OS_2","Teams_OS_3","Teams_OS_4","Teams_OS_5",
    "Teams_OT_1","Teams_OT_2","Teams_OT_3","Teams_OT_4","Teams_OT_5",
    "Teams_GS_1", "Teams_GS_2","Teams_GS_3","Teams_GS_4","Teams_GS_5",
"Dep_min_OP_1", "Dep_min_OP_2","Dep_min_OP_3","Dep_min_OP_4","Dep_min_OP_5",
"Dep_min_GY_1", "Dep_min_GY_2","Dep_min_GY_3","Dep_min_GY_4","Dep_min_GY_5",
"Dep_min_OS_1", "Dep_min_OS_2","Dep_min_OS_3","Dep_min_OS_4","Dep_min_OS_5",
"Dep_min_OT_1", "Dep_min_OT_2","Dep_min_OT_3","Dep_min_OT_4","Dep_min_OT_5",
"Dep_min_GS_1", "Dep_min_GS_2","Dep_min_GS_3","Dep_min_GS_4","Dep_min_GS_5",
    "Dep_max_OP_1", "Dep_max_OP_2","Dep_max_OP_3","Dep_max_OP_4","Dep_max_OP_5",
    "Dep_max_GY_1", "Dep_max_GY_2","Dep_max_GY_3","Dep_max_GY_4","Dep_max_GY_5",
    "Dep_max_OS_1", "Dep_max_OS_2","Dep_max_OS_3","Dep_max_OS_4","Dep_max_OS_5",
    "Dep_max_OT_1", "Dep_max_OT_2","Dep_max_OT_3","Dep_max_OT_4","Dep_max_OT_5",
    "Dep_max_GS_1", "Dep_max_GS_2","Dep_max_GS_3","Dep_max_GS_4","Dep_max_GS_5",
"Dep_week_min_OP", "Dep_week_min_GY", "Dep_week_min_OS", "Dep_week_min_OT", "Dep_week_min_GS",
"Dep_week_max_OP", "Dep_week_max_GY", "Dep_week_max_OS", "Dep_week_max_OT", "Dep_week_max_GS",
    "Max_target_OP", "Max_target_GY", "Max_target_OS", "Max_target_OT", "Max_target_GS" )

dimnames(OR_schedule) = list(ConstraintNames, VariableNames)


# Now we need to set up the constraints
# We will enter the constraint coefficients variable by variable

# (xOP_1), (xOP_2), (xOP_3), (xOP_4), (xOP_5)
set.column(OR_schedule, 1, c(rep(1,6), 8), indices=c(1,6,31,56,81,86,91))
set.column(OR_schedule, 2, c(rep(1,6), 8), indices=c(2,7,32,57,81,86,91))
set.column(OR_schedule, 3, c(rep(1,6), 8), indices=c(3,8,33,58,81,86,91))
set.column(OR_schedule, 4, c(rep(1,6), 8), indices=c(4,9,34,59,81,86,91))
set.column(OR_schedule, 5, c(rep(1,6), 8), indices=c(5,10,35,60,81,86,91))


# (xGY_1), (xGY_2), (xGY_3), (xGY_4), (xGY_5)
set.column(OR_schedule, 6, c(rep(1,6), 8), indices=c(1,11,36,61,82,87,92))
set.column(OR_schedule, 7, c(rep(1,6), 8), indices=c(2,12,37,62,82,87,92))
set.column(OR_schedule, 8, c(rep(1,6), 8), indices=c(3,13,38,63,82,87,92))
set.column(OR_schedule, 9, c(rep(1,6), 8), indices=c(4,14,39,64,82,87,92))
set.column(OR_schedule, 10, c(rep(1,6), 8), indices=c(5,15,40,65,82,87,92))

# (xOS_1), (xOS_2), (xOS_3), (xOS_4), (xOS_5)
set.column(OR_schedule, 11, c(rep(1,6), 8), indices=c(1,16,41,66,83,88,93))
set.column(OR_schedule, 12, c(rep(1,6), 8), indices=c(2,17,42,67,83,88,93))
set.column(OR_schedule, 13, c(rep(1,6), 8), indices=c(3,18,43,68,83,88,93))
set.column(OR_schedule, 14, c(rep(1,6), 8), indices=c(4,19,44,69,83,88,93))
set.column(OR_schedule, 15, c(rep(1,6), 8), indices=c(5,20,45,70,83,88,93))

# (xOS_1), (xOS_2), (xOS_3), (xOS_4), (xOS_5)
set.column(OR_schedule, 16, c(rep(1,6), 8), indices=c(1,21,46,71,84,89,94))
set.column(OR_schedule, 17, c(rep(1,6), 8), indices=c(2,22,47,72,84,89,94))
set.column(OR_schedule, 18, c(rep(1,6), 8), indices=c(3,23,48,73,84,89,94))
set.column(OR_schedule, 19, c(rep(1,6), 8), indices=c(4,24,49,74,84,89,94))
set.column(OR_schedule, 20, c(rep(1,6), 8), indices=c(5,25,50,75,84,89,94))

# (xGS_1), (xGS_2), (xGS_3), (xGS_4), (xGS_5)
set.column(OR_schedule, 21, c(rep(1,6), 8), indices=c(1,26,51,76,85,90,95))
set.column(OR_schedule, 22, c(rep(1,6), 8), indices=c(2,27,52,77,85,90,95))
set.column(OR_schedule, 23, c(rep(1,6), 8), indices=c(3,28,53,78,85,90,95))
set.column(OR_schedule, 24, c(rep(1,6), 8), indices=c(4,29,54,79,85,90,95))
set.column(OR_schedule, 25, c(rep(1,6), 8), indices=c(5,30,55,80,85,90,95))



# Now we need to indicate the type of constraint (<=, >=, or =)
set.constr.type(OR_schedule, c( rep("<=",30), rep(">=",25), rep("<=",25), rep(">=",5),   rep("<=",10)) )


# And set the right-hand sides
set.rhs(OR_schedule, c(rep(10,5), 2,2,2,2,2,3,3,3,3,3,0,1,0,1,0,1,1,1,1,1,6,6,6,6,6,  rep(0,25), 2,2,2,2,2,3,3,3,3,3,1,1,1,1,1,1,1,1,1,1,6,6,6,6,6,  3,12,2,2,18,  6,18,3,4,25,  39.4,117, 19.9, 26.3, 189) )


# Now let's define our objective coefficients:
set.objfn(OR_schedule, c( rep(8/39.4,5), rep(8/117,5),  rep(8/19.9,5), rep(8/26.3,5),   rep(8/189,5)))

# The default setting is minimize for the objective, so we need to tell R that we are maximizing our objective:

lp.control(OR_schedule,sense='max')


# We need to make our decision variables integer:
set.type(OR_schedule, seq(1,25,1), "integer")

# Let's take a look at our model:
write.lp(OR_schedule,  "OR_schedule.lp", type="lp")


# Solve the model:
solve(OR_schedule)

# Output of zero means the model was successfully solved. 

# Look at optimal objective and decision variables:
get.objective(OR_schedule)
get.variables(OR_schedule)

# Better way to look at the solution:
SolutionValues = get.variables(OR_schedule)
Solution = data.frame(VariableNames, SolutionValues)


# More functions in the lpSolveAPI package:
# http://cran.r-project.org/web/packages/lpSolveAPI/lpSolveAPI.pdf