module Collections
  class ItemManager
    attr_accessor :items
    def initialize
      @items = []
    end
    def load
      contents = File.read(FILENAME)
      contents.each_line do |line|
        item = ::Models::Item.from(line)
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
      dump
    end
    def unfinish(item_number)
      @items[item_number.to_i-1].status = false
      dump
    end
    def add(item_content)
      @items << Models::Item.from(item_content)
      dump
    end
    def delete(item_number)
      @items.delete_at(item_number.to_i-1)
      dump
    end
    def dump
      f=File.open(FILENAME,'w')
      @items.each do |i| 
        f.write i.display+"\n"
      end
      f.close
    end
  end
end
