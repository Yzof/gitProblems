#Link to Problem: https://www.hackerrank.com/challenges/compare-the-triplets/problem
def solve(*args)
  #
  # Write your code here.
  #
  a_points = 0
  b_points = 0
  a = args.take(3)
  b = args.drop(3)

  a.each_with_index do |a_score, idx|
    b_score = b[idx]
    case a_score <=> b_score
    when 1
    a_points += 1
    when -1
    b_points += 1
    end
  end

  [a_points, b_points]
end
