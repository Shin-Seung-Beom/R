# Source: [Deep Play] https://3months.tistory.com/399 

#  Object Oriented implementation & S3 class  ##########

#  Base R type  ##################################
#Every Base R object has a C structure that describes how the object is stored in memory.
#Base type can only be made by R core team. It is not a real object system.
#typeof function returns R base types (vector, list, function, builtin)

typeof(c("a"))# character vector-> Character
typeof(mean) #function-> closure
typeof(sum) #primitive function-> builtin(built in)
typeof(array(c(1.1, 2.2, 3.3))) #double
typeof(matrix(1:3))#integer
typeof(data.frame(x=1:10)) #list

#  S3  #####################################
# It is the most commonly used system in many packages in CRAN.
# The otype function of the pryr package outputs whether the object is the base type itself or S3 or S4, based on a base type.

library(pryr)
otype(c("a")) #base
otype(list(x=1:3)) #base
otype(data.frame(x=1:10)) #S3
otype(factor()) #S3

# define S3 class
# generate class and assign at once!
a<- structure(list(), class="foo"); a

# generate class and then assign
a<- list();a
class(a)<- "foo"; a

#  Inheritance  #############################
inherits(a, "foo") # a object inherits foo class

# example
# glm is subordinate class of lm class
model<- glm(mpg~cyl+hp, data=mtcars)
class(model)

inherits(model, "lm")

#  making generator of class  #######################

# usually generator functions have the same name of class
foo<- function(x){
  if(!is.numeric(x)) stop("X must be numeric")
  structure(list(x), class="foo")
}

# generating variables using generator
foo_var<- foo(1:3); foo_var
str(foo_var)
typeof(foo_var)
otype(foo_var)
class(foo_var)

length(foo_var)
#As base type is list, returns length of list 1

# In R you can chance the class of objects
mod<- lm(mpg~disp, data=mtcars)
class(mod)
typeof(mod)
mod

# Add data.frame class in lm class
class(mod)<- "data.frame"
mod #calls data frame S3 method

#  I Couldn't understand after here.
#  So, I stopped
#  generating new S3 method and generic  #########

# generic named f
#When you want to create a new generic, you create a function that calls the UseMethod().
#UseMethod receives the name of the generic method and the argent as input.
f<- function(x) UseMethod("f")

# Genetic is useless without methods. Genetic methods can be implemented as follows.
f.a<- function(x) "Class a"
d<- structure(list(), class="a")
class(d)

# call of generic function
f(d)

#adding method to a generic
mean.a<- function(x) "a"
mean(d)