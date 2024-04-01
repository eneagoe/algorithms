require 'minitest/autorun'

class TestSum < Minitest::Test
  def test_that_it_returns_empty_list_if_no_quadruplets_sum_to_target
    numbers = [1, 2, 3, 4]
    target = 0

    assert_empty four_sum(numbers:, target:)
  end

  def test_it_returns_list_of_quadruplets_summing_to_target
    numbers = [1, 0, -1, 0, -2, 2]
    target = 0

    assert_equal [[-2, -1, 1, 2], [-2, 0, 0, 2], [-1, 0, 0, 1]], four_sum(numbers:, target:).sort

    numbers = [2, 2, 2, 2, 2]
    target = 8

    assert_equal [[2, 2, 2, 2]], four_sum(numbers:, target:)
  end
end

def four_sum(numbers:, target:)
  result = []
  n = numbers.size

  return result if n < 4

  numbers.sort!

  (0...n - 3).each do |i|
    next if i.positive? && numbers[i] == numbers[i - 1]

    (i + 1...n - 2).each do |j|
      next if j > i + 1 && numbers[j] == numbers[j - 1]

      left, right = j + 1, n - 1

      while left < right
        total = numbers[i] + numbers[j] + numbers[left] + numbers[right]

        if left > j + 1 && numbers[left] == numbers[left - 1]
          left += 1
          next
        end

        if right < n - 1 && numbers[right] == numbers[right + 1]
          right -= 1
          next
        end

        if total == target
          result << [numbers[i], numbers[j], numbers[left], numbers[right]]
          left += 1
          right -= 1
        elsif total > target
          right -= 1
        else
          left += 1
        end
      end
    end
  end

  result
end
