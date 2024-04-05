require 'minitest/autorun'

# given an array of strings, return all groups of strings that are anagrams
class TestGroupAnagrams < Minitest::Test
  def test_that_it_returns_all_groups_of_anagrams
    assert_equal [%w[eat tea ate], %w[tan nat], ['bat']], group_anagrams(strings: %w[eat tea tan ate nat bat])
  end
end

def group_anagrams(strings:)
  strings.group_by { _1.chars.sort }.values
end
