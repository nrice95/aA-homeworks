class Stack
  attr_accessor :stack
  def initialize
    @stack = []
  end

  def push(el)
    self.stack << el
  end

  def <<(el)
    push(el)
  end

  def pop
    # return stack[0...-1]
    val = self.stack.last
    self.stack = self.stack[0...-1]
    val
  end

  def peek
    self.stack.last
  end
end

class Queue
  attr_accessor :queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    self.queue.unshift(el)
  end

  def dequeue
    val = self.queue.last
    self.queue = self.queue[0...-1]
    val
  end

  def peek
    self.queue.last
  end
end

class Map
  attr_accessor :map
  def initialize
    @map = []
  end

  def set(key, value)
    new_pair = [key,value]
    self.map.each do |pair|
      if pair.first == key
        pair[-1] = value
        return [key,value]
      end
    end
    self.map << new_pair
    new_pair
  end

  def get(key)
    self.map.each do |pair|
      return pair.last if pair.first == key
    end
    nil
  end

  def delete(key)
    self.map.each_with_index do |pair,i|
      if pair.first == key
        old_pair = pair
        self.map = self.map[0...i] + self.map[i+1..-1]
        return pair
      end
    end
    nil
  end

  def show
    length = self.map.count
    puts "["
    self.map.each_with_index do |el,i|
      print "   #{el}"
      puts "," if i != length
    end
    puts "]"
  end
end
