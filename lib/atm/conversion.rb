class Conversion
  attr_accessor :state, :command

  def initialize(command, state)
    @command = command
    @state = state
  end

  def pin_entered?
    state.wait_pin? && command.positive_integer?
  end
  
  def sum_entered?
    (state.menu? or state.balance? or state.cash?) && command.positive_integer?
  end
  
  def changes_possible?
    command.valid? && state.allows?(next_state)
  end

  def next_state
    case command.text
      when "INSERT"
       "WAIT_PIN"
      when "BACK"
       "MENU"
      when "BALANCE"
       "BALANCE"
      when "EXIT"
       "BYE"
      else
        case 
          when pin_entered?
            "MENU"
          when sum_entered?
            "CASH"
          else
            state.value
        end
    end    
  end

end