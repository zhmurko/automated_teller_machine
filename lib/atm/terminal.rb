class Terminal
  attr_accessor :output, :state, :errors

  def initialize
    @state = State.new
    @output = @state.value
    @card_reader = CardReader.new
    @bad_commands_counter = 0
    @total_commands_counter = 0
  end
  
  def accept(text)
    command = Command.new(text)
    @total_commands_counter += 1
    conversion = Conversion.new(command, state)
    if conversion.changes_possible? && @card_reader.process(command, state)
      @state.value = conversion.next_state
    else
      @errors = "BAD_COMMAND"
      @bad_commands_counter += 1
    end
    state.block_by(@block_reason) if limits_exeeded?
    set_output
  end

  def respond
    puts "#{@output}"
  end

  def set_output
    @output = case @state.value
      when "BALANCE"
         @card_reader.card.balance
      when "BLOCK"
        @block_reason
      else
        error_message = errors
        @errors, @card_reader.errors  = nil, nil
        error_message.empty? ? @state.value : error_message
    end
  end
  
  def errors
    [@errors, @card_reader.errors].join
  end  

  def ready?
    # any state except final
    not (@state.bye? || @state.block?)
  end    
  
  def limits_exeeded?
    case  
      when @card_reader.too_many_bad_pins
        @block_reason = "BAD_PIN"
      when @card_reader.too_many_bad_sums
        @block_reason = "BAD_SUM"
      when @card_reader.session_expired?
        @block_reason = "SESSION_TIMEOUT"
      when @state.time_expired?
        @block_reason = "STATE_LIMIT"
      when @bad_commands_counter >= Limit::BAD_COMMAND
        @block_reason = "BAD_COMMAND"
      when @total_commands_counter >= Limit::COMMAND_LIMIT
        @block_reason = "COMMAND_LIMIT"
      else 
        false
    end
  end  
    
end