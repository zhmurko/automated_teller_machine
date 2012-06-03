class Command
  VALID_COMMANDS = %w(INSERT BACK BALANCE EXIT)

  attr_accessor :input, :text
  
  def initialize(text)
    @text = text
    if positive_integer?
      @text = text.to_i
    else
      @text = text.chomp
    end
  end
  
  def positive_integer?
    value = @text.to_i
    value.is_a?(Fixnum) && value > 0  
  end

  def valid_command?
    VALID_COMMANDS.include? @text
  end
  
  
  def accepted?
    valid_command? || positive_integer?
  end
  
end