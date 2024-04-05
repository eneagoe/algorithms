require 'minitest/autorun'

# given two numbers as reversed arrays of their digits,
# return their sum in the same format
class TestSum < Minitest::Test
  def test_it_returns_the_sum_of_the_numbers
    assert_equal [7, 0, 8], add_nubmers(a: [2, 4, 3], b: [5, 6, 4])
    assert_equal [0, 1], add_nubmers(a: [9], b: [1])
  end
end

def add_nubmers(a:, b:)
  result = []
  n = a.size
  m = b.size

  carry = 0
  i = 0

  while i < n || i < m
    d1 = i < n ? a[i] : 0
    d2 = i < m ? b[i] : 0

    result << ((d1 + d2 + carry) % 10)
    carry = (d1 + d2 + carry) / 10

    i += 1
  end

  while carry.nonzero?
    result << (carry % 10)
    carry /= 10
  end

  result
end
