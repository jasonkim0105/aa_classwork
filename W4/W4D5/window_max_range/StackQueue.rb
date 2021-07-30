require_relative "myStack"

class StackQueue

  attr_reader :store

  def initialize()
    @stacks1 = MyStack.new
    @stacks2 = MyStack.new
  end

  def size
    @stacks1.size
  end

  def empty?
  end

  def enqueue
  end

  def dequeue
  end

end