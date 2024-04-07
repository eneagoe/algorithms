require 'minitest/autorun'

# return the max profit that can be made from buying/selling stocks
# given a list of daily stock prices
# restrictions: sell old stock before buying new one
class TestBuySell < Minitest::Test
  def test_it_returns_the_maxim_profit_from_one_transaction
    assert_equal 7, best_time_to_buy_and_sell(stocks: [7, 1, 5, 3, 6, 4])
    assert_equal 4, best_time_to_buy_and_sell(stocks: [1, 2, 3, 4, 5])
    assert_equal 0, best_time_to_buy_and_sell(stocks: [5, 4, 3, 2, 1])
  end
end

def best_time_to_buy_and_sell(stocks:)
  profit = 0

  stocks.each_cons(2) do |a, b|
    diff = b - a
    profit += diff if diff.positive?
  end

  profit
end
