module Models
  class Item
    attr_accessor :content, :status # attr_reader, attr_writer
    def initialize(_content,_status)
      @content = _content
      @status = _status
    end
    def display
      if @status
        "#{@content} #done"
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
end
