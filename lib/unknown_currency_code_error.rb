class UnknownCurrencyCodeError < StandardError
  def message
    "Error: Unknown currency."
  end
end
