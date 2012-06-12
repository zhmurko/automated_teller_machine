class State
  VALID_STATES = %w( INIT WAIT_PIN MENU BALANCE CASH BYE BLOCK )
  TRANSFORMATIONS = {
    "INIT"      => [ "WAIT_PIN", "BYE" ],
    "WAIT_PIN"  => [ "MENU", "BYE" ],
    "MENU"      => [ "CASH", "BALANCE", "BYE" ],
    "BALANCE"   => [ "MENU", "BYE" ],
    "CASH"      => [ "MENU", "BALANCE", "BYE" ],
    "BLOCK"     => [ "BYE" ]
  }
  
  attr_accessor :value, :updated_at, :block_reason

  def initialize(name = "INIT")
    @value = name
    @updated_at = Time.now
  end
  
  def value=(name)
    @value = name
    @updated_at = Time.now  unless time_expired?
  end
    
  def possible_next_states
    TRANSFORMATIONS[@value]
  end
    
  def allows?(new_state)
     possible_next_states.include?(new_state) || valid_integer?
  end
  
  def time_expired?
    Time.now - @updated_at >= Limit::STATE_LIMIT
  end
  
  def valid_pin?
    @value =~ /\d{4}/
  end
  
  def valid_integer?
    sum = @value.to_i
    sum.is_a?(Integer) &&  sum > 0
  end  

  def block_by(reason)
    @value = "BLOCK"
    @block_reason = reason
  end

  # generate methods like .menu? or .cash? 
  VALID_STATES.each do |state|
    define_method "#{state.downcase}?" do
      self.value == state.to_s.upcase
    end
  end
  
end