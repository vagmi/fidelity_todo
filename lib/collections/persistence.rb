module Collections
  module Persistence
    def self.included(base)
      base.class_eval <<-EOF
       @model_class = nil
       extend ClassMethods
      EOF
    end

    module ClassMethods
      def model
        @model_class
      end
      def model_class(klass)
        @model_class = klass
      end
    end

    def initialize
      @elements = []
    end
    def add(item_content)
      @elements << self.class.model.from(item_content)
      dump
    end

    def delete(item_number)
      @elements.delete_at(item_number.to_i-1)
      dump
    end

    def load
      contents = File.read(FILENAME)
      contents.each_line do |line|
        item = self.class.model.from(line)
        @elements << item 
      end
    end

    def dump
      f=File.open(FILENAME,'w')
      @elements.each do |i| 
        f.write i.display+"\n"
      end
      f.close
    end
  end
end
