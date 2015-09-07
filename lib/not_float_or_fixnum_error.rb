class NotFloatOrFixnumError < StandardError
  def message
    "Error: Can multiply Currency objects only with Float or Fixnum."
  end
end
