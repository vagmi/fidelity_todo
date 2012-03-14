class A
  def hello(name)
    puts "hello #{name}"
  end
  def method_missing(name,*args)
    if(name==:newHello)
      self.send(:new_hello, *args)
    end
    super
  end
end

class B < A
  def hello
    puts "overridden by class b"
    super("world")
  end
  def new_hello
    puts "should be private"
  end
end

B.new.newHello2

