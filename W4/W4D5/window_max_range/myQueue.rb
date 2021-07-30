class MyQueue

  attr_reader :store
  def initialize
    @store = []
  end

  def peek
    @store.last
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end

  def enqueue(value)
    @store.push(value)
  end

  def dequeue
    @store.shift
  end
end