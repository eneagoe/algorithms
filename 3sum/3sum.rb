require 'minitest/autorun'

# return all unique triplets in an input array that sum to zero
# elements in a triplet must be in ascending order
class TestSum < Minitest::Test
  def test_that_it_returns_empty_list_if_no_triplets_sum_to_zero
    numbers = [1, 2, 3]

    assert_empty triplet_sum(numbers:)
  end

  def test_it_returns_list_of_triplets_summing_to_zero
    numbers = [-1, 0, 1, 2, -1, -4]

    assert_equal [[-1, -1, 2], [-1, 0, 1]], triplet_sum(numbers:)
  end
end

def triplet_sum(numbers:)
  result = []

  numbers.sort!
  n = numbers.size

  i = 0
  while i < n
    target = -numbers[i]
    left = i + 1
    right = n - 1

    while left < right
      if numbers[left] + numbers[right] == target
        result << [numbers[i], numbers[left], numbers[right]]

        left += 1
        right -= 1

        while left < right && numbers[left] == numbers[left - 1]
          left += 1
        end

        while left < right && numbers[right] == numbers[right + 1]
          right -= 1
        end
      elsif numbers[left] + numbers[right] < target
        left += 1
      else
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
