class PolyTreeNode
  attr_reader :value, :parent, :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(node)
    self.parent.children.delete(self) if self.parent
    @parent = node

    if @parent != nil && !node.children.include?(self)
      node.children << self
    end
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    raise 'error' if !self.children.include?(child_node)
    child_node.parent = nil
  end

  def dfs(target_value)
    return self if self.value == target_value

    self.children.each do |child|
      result = child.dfs(target_value)
      return result if result
    end
    return nil
  end

  def bfs(target_value)   # [6, 3, 4, 5] unshift(6)
    queue_arr = []
    queue_arr << self
    until queue_arr.empty?
      curr = queue_arr.pop #dequeue
      return curr if curr.value == target_value 
      curr.children.each { |child| queue_arr.unshift(child) } #enqueue
    end
    nil
  end

end