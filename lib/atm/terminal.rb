class Terminal
  attr_accessor :state
  
  def accept(command)
    @command = Command.new(command)
    if @command.accepted?
      state = @command.new_state
    end
    respond @command.answer    
  end

  def respond(text)
    puts text
  end
end