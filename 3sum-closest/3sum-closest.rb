require 'minitest/autorun'

# return the sum closest to a given target
class TestSum < Minitest::Test
  def test_it_returns_the_closest_sum_to_target
    numbers = [-1, 2, 1, -4]
    target = 1

    assert_equal 2, closest_3sum(numbers:, target:)
  end
end

def closest_3sum(numbers:, target:)
  result = 0
  diff = Float::INFINITY

  numbers.sort!
  n = numbers.size

  i = 0
  while i < n
    left = i + 1
    right = n - 1

    while left < right
      sum = numbers[i] + numbers[left] + numbers[right]

      return target if sum == target

      if sum < target
        if target - sum < diff
          diff = target - sum
          result = sum
        end

        left += 1
      else
        if sum - target < diff
          diff = sum - target
          result = sum
        end

        right -= 1
      end
    end

    if i < n - 1
      i += 1 while i < n - 1 && numbers[i] == numbers[i + 1]
    end

    i += 1
  end

  result
end
