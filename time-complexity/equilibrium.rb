require 'byebug'

# A non-empty array A consisting of N integers is given. Array A represents numbers on a tape.

# Any integer P, such that 0 < P < N, splits this tape into two non-empty parts: A[0], A[1], ..., A[P − 1] and A[P], A[P + 1], ..., A[N − 1].

# The difference between the two parts is the value of: |(A[0] + A[1] + ... + A[P − 1]) − (A[P] + A[P + 1] + ... + A[N − 1])|

# In other words, it is the absolute difference between the sum of the first part and the sum of the second part.

# For example, consider array A such that:

#   A[0] = 3
#   A[1] = 1
#   A[2] = 2
#   A[3] = 4
#   A[4] = 3
# We can split this tape in four places:

# P = 1, difference = |3 − 10| = 7
# P = 2, difference = |4 − 9| = 5
# P = 3, difference = |6 − 7| = 1
# P = 4, difference = |10 − 3| = 7
# Write a function:

# def solution(a)

# that, given a non-empty array A of N integers, returns the minimal difference that can be achieved.

# For example, given:

#   A[0] = 3
#   A[1] = 1
#   A[2] = 2
#   A[3] = 4
#   A[4] = 3
# the function should return 1, as explained above.

# Write an efficient algorithm for the following assumptions:

# N is an integer within the range [2..100,000];
# each element of array A is an integer within the range [−1,000..1,000].

#0,1,2,3,4
arr = [3,1,2,4,3] # ok

# pivot 0 -> impossible there's no left side

# pivot 1 -> left = 3 right = 10, diff = -7

# pivot 2 -> left = 4 right = 9, diff = -5

# pivot 3 -> left = 6 right = 7, diff -1

# pivot 4 -> left = 10 right = 3, diff 7


def solution(a)
  return unless a.size > 1

  possible_pivots = a.size - 1

  solutions_arr = []
  
  possible_pivots.times do |i|
    pivot = i + 1
    
    # [3]
    left_side = a.slice(0, i).sum
    
    # [1,2,4,3]
    right_side = a.slice(i, possible_pivots).sum
    
    total = (left_side - right_side).abs

   
    solutions_arr << total
  end

  return solutions_arr.min
end

puts solution(arr)