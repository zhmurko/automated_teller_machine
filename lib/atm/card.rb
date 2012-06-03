class Card
  attr_accessor :pin, :balance

  def initialize(pin = 1234, balance = 10000)
    @pin = pin
    @balance = balance
  end
  
  def reduce_balance(sum)
    if @balance >= sum
      @balance = @balance - sum 
    else
      @balance 
    end    
  end
  
end