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

# pivot 1 -> left = 3 right = 7, diff = -4

# pivot 2 -> left = 4 right = 6, diff = -2

# pivot 3 -> left = 6 right = 4, diff 2

def solution(a)
  sum_left = a[0]
  sum_right = a.inject(0) {|sum, x| sum + x} - a[0]

  diff = (sum_left - sum_right).abs

  for i in (1..a.length - 2) do
    sum_left += a[i]
    sum_right -= a[i]
    current_diff = (sum_left - sum_right).abs
    diff = current_diff if (diff > current_diff)
  end
  
  diff
end

puts solution(arr)