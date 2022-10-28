# create sequences
rep(1,10)
rep("HAHA", 20)
seq(1,10)
seq(50,70,by=5)
list1 = list(4,18,42,"hello")
seq_along(list1) # enumerates till the end of the list
seq(list1) # same output as before (in this case)
seq(10)
seq_along(10) # NOT same output as before
seq_len(10) # better to use this that seq()

# logical statements
ifelse(3>5,1,"this is false")
if_else(3>5,1,"this is false") # fails bc the value when FALSE is not a double.

# string manipulation
paste("Hello", "amigo")
paste("Hello", "amigo", sep = "--")
paste0("Hello", "amigo")
paste0(c("Joseph", "Mary", "Jesus"), collapse = ", and ")
tolower("HAHAHAHAH")
toupper("hueuehuehuheuhe")
