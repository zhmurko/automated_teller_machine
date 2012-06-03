$LOAD_PATH.unshift(File.dirname(__FILE__) + '/lib')
require 'atm'

terminal = Terminal.new
terminal.respond

while terminal.ready? do
  terminal.accept STDIN.gets
  terminal.respond
end