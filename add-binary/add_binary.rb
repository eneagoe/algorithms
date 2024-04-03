require 'minitest/autorun'

# given two binary strings, return their sum (as binary string)
class TestSum < Minitest::Test
  def test_it_returns_the_binary_sum_of_two_strings
    assert_equal '0', binary_sum(a: '0', b: '0')
    assert_equal '100', binary_sum(a: '1', b: '11')
    assert_equal '10101', binary_sum(a: '1010', b: '1011')
  end
end

def binary_sum(a:, b:)
  result = []
  carry = 0

  n = a.size
  m = b.size
  i = a.size - 1
  j = b.size - 1

  while i >= 0 || j >= 0
    u = i >= 0 && i < n ? a[i].to_i : 0
    v = j >= 0 && j < m ? b[j].to_i : 0

    result << ((u + v + carry) % 2)
    carry = (u + v + carry) / 2

    i -= 1
    j -= 1
  end

  result << 1 if carry == 1

  result.reverse.join
end
