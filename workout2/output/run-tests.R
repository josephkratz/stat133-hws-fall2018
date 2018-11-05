# This is a master script to test all functions in with workout2 folder
# Those functions are minkowski(), is_hex(), is_hex_alpha(), 
# reverse_chars(), and count_vowels

library('testthat')
library('stringr')

functions <- dir('../code/functions')
lapply(paste0('../code/functions/', functions), source)
sink(file = 'test-output.txt')
test_dir('../code/tests')
sink()