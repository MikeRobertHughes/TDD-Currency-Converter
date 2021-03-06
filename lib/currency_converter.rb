require_relative "currency"
require_relative "unknown_currency_code_error"


class CurrencyConverter

  attr_reader :exchange_rates

  def initialize
    @exchange_rates = {:USD=>1, :EUR=>0.89, :JPY=>119.366, :GBP=>0.65428, :AUD=>1.44375}
  end

  def convert(currency_obj, country_code_input)
    if currency_obj.is_a?(Currency) && @exchange_rates.has_key?(country_code_input) && @exchange_rates.has_key?(currency_obj.country_code)
      new_country_code = country_code_input
      new_amount = (currency_obj.amount * (@exchange_rates[country_code_input] / @exchange_rates[currency_obj.country_code])).round(2)
      Currency.new(new_country_code, new_amount)
    else
      raise UnknownCurrencyCodeError
    end
  end
end

