require 'collections/persistence'
module Collections
  class ItemManager
    include Persistence
    model_class ::Models::Item
    def display
      puts "There are #{@elements.count} items"
      puts "----------"
      ctr=1
      @elements.each do |i| 
        puts "#{ctr} #{i.display}"
        ctr +=1
      end
    end
    def finish(item_number)
      @elements[item_number.to_i-1].status = true
      dump
    end
    def unfinish(item_number)
      @elements[item_number.to_i-1].status = false
      dump
    end
  end
end
