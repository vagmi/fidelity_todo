$:.unshift(File.join(File.expand_path(File.dirname(__FILE__),"lib")))

require 'models/item'
require 'collections/item_manager'



FILENAME = "todo.txt"


im = Collections::ItemManager.new
im.load
if(ARGV[0])
  command = ARGV[0]
  im.send(command.to_sym,*ARGV[1..-1])
end
im.display
