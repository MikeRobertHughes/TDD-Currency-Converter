require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/currency'

class CurrencyTest < Minitest::Test

  def test_currency_exists
    assert(Currency)
  end

  def test_currency_has_country_code
    currency = Currency.new('usd', 1)
    assert_equal(:USD, currency.country_code)
  end

  def test_currency_has_amount
    currency = Currency.new('USD', 1)
    assert_equal(1, currency.amount)
  end

  def test_currency_object_equals_other_currency_objec_with_same_code_and_amount
    currency1 = Currency.new('USD', 1)
    currency2 = Currency.new('USD', 1)
    result = currency1 == currency2
    assert_equal(true, result)
  end

  def test_currency_object_does_not_equal_currency_objec_with_diff_code
    currency1 = Currency.new('USD', 1)
    currency2 = Currency.new('GBP', 1)
    result = currency1 == currency2
    assert_equal(false, result)
  end

  def test_currency_object_does_not_equal_currency_objec_with_same_code_and_dif_amount
    currency1 = Currency.new('USD', 1)
    currency2 = Currency.new('USD', 2)
    result = currency1 == currency2
    assert_equal(false, result)
  end

  def test_currency_can_be_added
    currency1 = Currency.new('USD', 1)
    currency2 = Currency.new('USD', 2)
    result = currency1 + currency2
    assert_equal(Currency.new('USD', 3), result)
  end

  def test_currency_with_different_code_cannot_be_added
    assert_raises(DifferentCurrencyCodeError) do
      currency1 = Currency.new('USD', 1)
      currency2 = Currency.new('GBP', 2)
      result = currency1 + currency2
    end
  end

  def test_currency_can_be_subtracted
    currency1 = Currency.new('USD', 3)
    currency2 = Currency.new('USD', 1)
    result = currency1 - currency2
    assert_equal(Currency.new('USD', 2), result)
  end

  def test_currency_equals_zerp_if_value_subtracted_greater_than_initial_value
    currency1 = Currency.new('USD', 1)
    currency2 = Currency.new('USD', 3)
    result = currency1 - currency2
    assert_equal(Currency.new('USD', 0), result)
  end

  def test_currency_with_different_code_cannot_be_subtracted
    assert_raises(DifferentCurrencyCodeError) do
      currency1 = Currency.new('USD', 1)
      currency2 = Currency.new('GBP', 2)
      result = currency1 + currency2
    end
  end

  def test_currency_can_be_multiplied_by_fixnum
    currency1 = Currency.new('USD', 1)
    result = currency1 * 3
    assert_equal(Currency.new('USD', 3), result)
  end

  def test_currency_can_be_multiplied_by_float
    currency1 = Currency.new('USD', 1)
    result = currency1 * 3.3
    assert_equal(Currency.new('USD', 3.3), result)
  end

  def test_currency_with_different_code_cannot_be_subtracted
    assert_raises(NotFloatOrFixnumError) do
      currency1 = Currency.new('USD', 1)
      currency1 * "Hello"
    end
  end
end































