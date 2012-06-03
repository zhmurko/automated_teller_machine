class Terminal
  VALID_STATES = %w( INIT WAIT_PIN MENU BALANCE CASH BYE BLOCK )
  attr_accessor :state, :output, :card, :command

  def initialize
    @state = "INIT"
    @output = "INIT"
  end
  
  def accept(text)
    @command = Command.new(text)
    if @command.accepted?
       change_state
       manage_card 
    else 
      verify_errors_limit
    end
    set_output
  end

  def respond
    puts @output
  end

  def change_state
    puts "Got: #{command.text}"
    @state = case @command.text
      when "INSERT"
        "WAIT_PIN"
      when "BALANCE"
        "BALANCE"
      when "BACK"
        "MENU"
      when "EXIT"
        "BYE"
      else
        case
          when @state == "MENU" && @command.positive_integer?
            "CASH"
          when @state == "WAIT_PIN" && @command.text.to_i == @card.pin.to_i
            "MENU"
        end
      end
  end

  def manage_card
    case @command.text
      when "INSERT"
        @card = Card.new
    end
    case @state
      when "CASH"
        @card.reduce_balance(@command.text)
    end
  end
  
  def verify_errors_limit
    @output = 'BAD_COMMAND'
    @state = "BAD_COMMAND"
  end
  
  def set_output
    @output = case @state
    when "BALANCE"
      @card.balance
    when "BLOCK"
      #TODO: return block reason
      "block reason"
    else
      @state
    end
  end
  
  def ready?
    not (@state == "BYE" || @state == "BLOCK")
  end    
end