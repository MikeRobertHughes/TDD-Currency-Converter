require_relative 'different_currency_code_error'
require_relative 'not_float_or_fixnum_error'

class Currency

  attr_reader :country_code, :amount

  def initialize(country_code, amount)
    @country_code = country_code.to_sym.upcase
    @amount = amount
  end

  def ==(other)
    if other.is_a?(Currency)
      if (other.country_code == self.country_code) && (other.amount == self.amount)
        true
      else
        false
      end
    else
      false
    end
  end

  def +(other)
    if other.is_a?(Currency) && other.country_code == self.country_code
      new_amount = other.amount + @amount
      Currency.new(@country_code, new_amount)
    else
      raise DifferentCurrencyCodeError
    end
  end

  def -(other)
    if other.is_a?(Currency) && other.country_code == self.country_code
      new_amount = @amount - other.amount
      new_amount = 0 if new_amount < 0
      Currency.new(@country_code, new_amount)
    else
      raise DifferentCurrencyCodeError
    end
  end

  def *(other)
    if other.is_a?(Fixnum) || other.is_a?(Float)
      new_amount = other * @amount
      Currency.new(@country_code, new_amount)
    else
      raise NotFloatOrFixnumError
    end
  end


end































