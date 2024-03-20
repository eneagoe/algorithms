require 'minitest/autorun'

# return the indices (not 0-based) of input numbers summing up to target,
# or nil if there are no numbers summing up to target
class TestSum < Minitest::Test
  def test_that_it_returns_the_two_indexes_summing_up_to_target
    numbers = [2, 7, 11, 15]
    target = 9

    assert_equal [1, 2], sums_to_hash(numbers:, target:)
    assert_equal [1, 2], sums_to_pointers(numbers:, target:)
  end

  def test_that_it_returns_empty_list_if_no_two_numbers_sum_up_to_target
    numbers = [1, 2, 3]
    target = 7

    assert_empty sums_to_hash(numbers:, target:)
    assert_empty sums_to_pointers(numbers:, target:)
  end
end

# O(n) solution, hashing
def sums_to_hash(numbers:, target:)
  seen = {}

  numbers.each.with_index(1) do |n, i|
    return [seen[target - n], i].sort if seen.key?(target - n)

    seen[n] = i
  end

  []
end

# O(nlog(n)) solution, 2-pointers, sorting
def sums_to_pointers(numbers:, target:)
  left = 0
  right = numbers.size - 1
  s = numbers.zip(1..).sort

  while left < right
    return [s[left][1], s[right][1]].sort if s[left][0] + s[right][0] == target

    if s[left][0] + s[right][0] > target
      right -= 1
    else
      left += 1
    end
  end

  []
end
