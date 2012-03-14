# Todo.rb
# Read a file and store the todos in memory
# Mark an entry in the file as done
# add entries to a file

FILENAME = "todo.txt"


class ItemManager
  attr_accessor :items
  def initialize
    @items = []
  end
  def load
    contents = File.read(FILENAME)
    contents.each_line do |line|
      item = Item.from(line)
      @items << item # same as items.push(item)
    end
  end
  def display
    puts "There are #{@items.count} items"
    puts "----------"
    ctr=1
    @items.each do |i| 
      puts "#{ctr} #{i.display}"
      ctr +=1
    end
  end
  def finish(item_number)
    @items[item_number.to_i-1].status = true
  end
end

class Item
  attr_accessor :content, :status # attr_reader, attr_writer
  def initialize(_content,_status)
    @content = _content
    @status = _status
  end
  def display
    if @status
      "#{@content} [done]"
    else
      @content
    end
  end
  def self.from(content)
    _status = !!(content =~ /\#done$/)
    _content = content.sub(/\#done$/,'').strip
    Item.new(_content, _status)
  end
end


im = ItemManager.new
im.load
if(ARGV[0])
  command = ARGV[0]
  im.send(command.to_sym,*ARGV[1..-1])
end
im.display
