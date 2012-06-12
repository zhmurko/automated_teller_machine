class Card
  attr_accessor :pin, :balance

  def initialize(pin = 1234, balance = 10000)
    @pin = pin
    @balance = balance
    @created_at = Time.now
  end
  
  def valid_pin?(num)
    num.to_i == @pin
  end

  def reduce_balance(sum)
    if @balance >= sum.to_i
      @balance = @balance - sum.to_i
    else
      false
    end    
  end
    
  def session_expired?
    Time.now - @created_at >= Limit::SESSION_TIMEOUT
  end  
  
end