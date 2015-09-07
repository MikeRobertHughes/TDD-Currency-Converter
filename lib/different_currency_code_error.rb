class DifferentCurrencyCodeError < StandardError
  def message
    "Error: Cannot add or subtract Currency objects with different currency codes."
  end
end
