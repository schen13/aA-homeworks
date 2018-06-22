class Stack
  def initialize
    @stack = []
  end

  def push(el)
    @stack.push(el)
  end

  def pop
    @stack.pop
  end

  def peek
    @stack.last
  end
end

class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.unshift(el)
  end

  def dequeue
    @queue.pop
  end

  def peek
    @queue.last
  end
end

class Map
  def initialize
    @map = []
  end

  def set(key, value)
    pair_exists = false
    @map.each_with_index do |pair, idx|
      if pair[0] == key
        @map[idx][1] = value
        pair_exists = true
      end
    end
    @map.push([key, value]) unless pair_exists
    @map
  end

  def get(key)
    @map.each { |pair| return pair[1] if pair[0] == key }
    "No such key found."
  end

  def delete(key)
    @map.reject! { |pair| pair[0] == key }
  end

  def show
    @map
  end
end
