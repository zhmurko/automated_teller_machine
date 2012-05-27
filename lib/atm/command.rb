class Command
  VALID_COMMANDS = %w(INSERT BACK BALANCE EXIT)

  attr_accessor :input
  
  def initialize(text)
    @text = text
  end
  
  def positive_integer?
    value = self.text.to_i 
    value.is_a?(Integer) && value > 0  
  end
end