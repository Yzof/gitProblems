#Link to Problem: https://www.hackerrank.com/challenges/diagonal-difference/problem

def diagonalDifference(a)
  length = a.length

  first_diag = diagonalPositions('right', a.length)
  second_diag = diagonalPositions('left', a.length)

  first_sum = 0
  second_sum = 0

  (length - 1).downto(0) do |idx|
    first_x, first_y = first_diag[idx]
    second_x, second_y = second_diag[idx]

    first_el = a[first_y][first_x]
    second_el = a[second_y][second_x]

    first_sum += first_el
    second_sum += second_el
  end

  (first_sum - second_sum).abs
end

def diagonalPositions(direction, length)
  slope, start = nil, nil

  if direction == 'right'
    start = [0, 0]
    slope = [1, 1]
  else
    start = [length - 1, 0]
    slope = [-1, 1]
  end

  pos = [start]

  while pos.length < length
    new_pos = Marshal.load(Marshal.dump(pos[-1]))
    new_pos[0] += slope[0]
    new_pos[1] += slope[1]
    pos << new_pos
  end

  pos
end
