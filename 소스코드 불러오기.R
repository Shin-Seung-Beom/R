library(randomForest)

randomForest
#useMethod("randomForest") means that function randomForest is a S3 generic function that has methods for different object classes.

#  The S3 method dispatch system
#For S3 classes, you can use the methods function to list the methods for a particular generic or class.
methods(randomForest)
.S3methods(randomForest) #brings only S3 functions, not S4
#asterisk means the  function is not exported from its package's namespace

# You don't have to know which package the function came from
getAnywhere(randomForest) 

# Functions that call .C, .Call, .Fortran, .External, .Internal, or .Primitive are calling entry points in compiled code
#to view compiled code in a package, you will need to download/unpack the package source
setwd("D:\\Category\\Decision Tree\\Random Forests")
#download.packages(pkgs="randomForest", type="source", destdir=".")# two files are installed. We need second file.
untar(download.packages(pkgs="randomForest", type="source", destdir=".")[, 2])

# The src in the file which is untared.
# It's C language!
# src -> rfutils -> permuteOOB
# src -> rf -> importance

# It's R
# R -> importance: nothing