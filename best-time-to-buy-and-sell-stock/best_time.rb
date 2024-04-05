require 'minitest/autorun'

# return the max profit that can be made from one buy/sell transaction
# given a list of daily stock prices
class TestBuySell < Minitest::Test
  def test_it_returns_the_maxim_profit_from_one_transaction
    assert_equal 5, best_time_to_buy_and_sell(stocks: [7, 1, 5, 3, 6, 4])
    assert_equal 0, best_time_to_buy_and_sell(stocks: [3, 2, 1])
  end
end

def best_time_to_buy_and_sell(stocks:)
  min = Float::INFINITY
  profit = 0

  stocks.each do |stock|
    min = [min, stock].min
    diff = stock - min
    profit = [profit, diff].max
  end

  profit
end
