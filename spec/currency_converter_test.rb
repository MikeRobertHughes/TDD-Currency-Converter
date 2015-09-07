require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/currency_converter'
require_relative '../lib/currency'


class CurrencyConverterTest < Minitest::Test

  def test_currency_converter_exists
    assert(CurrencyConverter)
  end

  def test_should_be_initialized_with_hash_of_three_or_more_curreny_codes
    converter = CurrencyConverter.new()
    assert_equal({:USD=>1, :EUR=>0.89, :JPY=>119.366, :GBP=>0.65428, :AUD=>1.44375}, converter.exchange_rates)
  end

  def test_should_be_able_to_accept_currency_object_with_country_code
    converter = CurrencyConverter.new()
    currency_obj = Currency.new(:USD, 1)
    converted_obj = converter.convert(currency_obj, :EUR)
    assert_equal(Currency.new(:EUR, 0.89), converted_obj)
  end

  def test_should_be_able_to_convert_different_currencies
    converter = CurrencyConverter.new()
    currency_obj = Currency.new(:EUR, 1)
    converted_obj = converter.convert(currency_obj, :JPY)
    assert_equal(Currency.new(:JPY, 134.12), converted_obj)
  end

  def test_should_raise_error_if_convert_to_currency_code_not_known
    assert_raises(UnknownCurrencyCodeError) do
      converter = CurrencyConverter.new()
      currency_obj = Currency.new(:EUR, 1)
      converted_obj = converter.convert(currency_obj, :RBL)
    end
  end

  def test_should_raise_error_if_convert_from_currency_code_not_known
    assert_raises(UnknownCurrencyCodeError) do
      converter = CurrencyConverter.new()
      currency_obj = Currency.new(:RBL, 66.877)
      converted_obj = converter.convert(currency_obj, :USD)
    end
  end
end

