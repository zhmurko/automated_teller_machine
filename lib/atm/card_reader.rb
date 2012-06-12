class CardReader
  attr_accessor :card, :errors, :bad_pin, :bad_sum

  def initialize
    @bad_pin = 0    
    @bad_sum = 0
  end

  def process(command, state)
    case command.text
      when "INSERT"
        @card = Card.new
    end
    case
      when state.wait_pin?
        unless @card.valid_pin?(command.text)
          @bad_pin += 1
          @errors = "BAD_PIN"
          return false
        end 
      when state.menu? && command.positive_integer?
        unless @card.reduce_balance(command.text)
          @bad_sum += 1
          @errors = "BAD_SUM"
          return false
        end
    end  
    true
  end
  
  def too_many_bad_pins
    @bad_pin >= Limit::BAD_PIN
  end
  
  def too_many_bad_sums
    @bad_sum >= Limit::BAD_SUM
  end

  def session_expired?
    @card && @card.session_expired?
  end
  
end