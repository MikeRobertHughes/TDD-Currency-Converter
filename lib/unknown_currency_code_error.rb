class UnknownCurrencyCodeError < StandardError
  def message
    "Error: Unknown currency or object not of type Currency."
  end
end
