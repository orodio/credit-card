class CreditCard
  attr_reader :number

  def initialize number
    @number = number.to_s.gsub(/[^0-9]/,'')
  end

  def type
    @type = case @number
    when /^4(\d{12}|\d{15})$/
      'VISA'
    when /^5[1-5]\d{14}$/
      'MasterCard'
    when /^3[47]\d{13}$/
      'AMEX'
    when /^6011\d{12}/
      'Discover'
    else
      'Unknown'
    end
  end

  def valid? # luhn
    return @valid if @valid
    array = @number.to_s.split('').map(&:to_i).reverse
    array = array.each_with_index.map { |int, index| index.even? ? int : (int * 2).digital_root }
    @valid = array.reduce(&:+) % 10 == 0 && type != 'Unknown'
  end

  def output
    "#{type}: #{@number} (#{valid? ? 'valid' : 'invalid'})"
  end
end

class Integer
  #shamelessly stolen from stuart
  def digital_root
    self == 0 ? 0 : 1 + ((self - 1) % 9)
  end
end
