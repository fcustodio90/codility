require 'byebug'
# An array A consisting of N different integers is given. The array contains integers in the range [1..(N + 1)], which means that exactly one element is missing.

# Your goal is to find that missing element.

# Write a function:

# def solution(a)

# that, given an array A, returns the value of the missing element.

# For example, given array A such that:

#   A[0] = 2
#   A[1] = 3
#   A[2] = 1
#   A[3] = 5
# the function should return 4, as it is the missing element.

# Write an efficient algorithm for the following assumptions:

# N is an integer within the range [0..100,000];
# the elements of A are all distinct;
# each element of array A is an integer within the range [1..(N + 1)].


array = [2,3,1,5,4,6]

def solution(a)
  length = a.length
  
  max_sum = 0
  available_sum = 0

  (0..length + 1).each {|i| max_sum += i }

  a.each {|i| available_sum += i}

  return max_sum - available_sum
end


puts solution(array)

