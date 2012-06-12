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
  
  def valid?
    valid_command? || positive_integer?
  end

  def valid_command?
    VALID_COMMANDS.include? @text
  end

  def positive_integer?
    only_numbers? && positive?
  end
  
  def positive?
    @text.to_i > 0  
  end
  
  def only_numbers?
    @text.to_s =~ /\A\d+\Z/
  end
    
end