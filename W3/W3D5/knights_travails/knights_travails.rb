require_relative "PolyTreeNode.rb"

class KnightPathFinder
  attr_reader :considered_positions, :root_node
  def initialize(pos)
    @root_node = PolyTreeNode.new(pos)
    @considered_positions = [@root_node.value]
    build_move_tree

  end

  def self.valid_moves(pos) #(4,5) -> [2, 4][2,6][3,3][3,7][5,3][5,7][6,4][6,6]
    #[0, 0] [0,1] [0,2] [0, 3] [0, 4][0, 5] [0,6] [0,7]
    #[1, 0] [1,1] [1,2] [1, 3] [1, 4][1, 5] [1,6] [1,7]
    #[2, 0] [2,1] [2,2] [2, 3] [2, 4][2, 5] [2,6] [2,7]
    #[3, 0] [3,1] [3,2] [3, 3] [3, 4][3, 5] [3,6] [3,7]
    #[4, 0] [4,1] [4,2] [4, 3] [4, 4][4, 5] [4,6] [4,7]
    #[5, 0] [5,1] [5,2] [5, 3] [5, 4][5, 5] [5,6] [5,7]
    #[6, 0] [6,1] [6,2] [6, 3] [6, 4][6, 5] [6,6] [6,7]
    #[7, 0] [7,1] [7,2] [7, 3] [7, 4][7, 5] [7,6] [7,7]
    array_moves = []
    array_moves << [pos[0]-2, pos[1]-1] << [pos[0]-2, pos[1]+1]
    array_moves << [pos[0]-1, pos[1]-2] << [pos[0]-1, pos[1]+2]
    array_moves << [pos[0]+1, pos[1]-2] << [pos[0]+1, pos[1]+2]
    array_moves << [pos[0]+2, pos[1]-1] << [pos[0]+2, pos[1]+1]

    array_moves.reject do |move|
      move[0] < 0 || move[0] > 7 || move[1] < 0 || move[1] > 7
    end

  end

  def new_move_positions(pos)
    moves = KnightPathFinder.valid_moves(pos)
    new_moves = moves.reject { |m| @considered_positions.include?(m) }
    @considered_positions += new_moves
    new_moves
  end

  def build_move_tree

    queue_arr = [@root_node]
    until queue_arr.empty?
      curr = queue_arr.shift #dequeue
      curr_pos = curr.value
      new_moves = new_move_positions(curr_pos)
      new_moves.each do |p|
        next_node = PolyTreeNode.new(p)
        curr.add_child(next_node)
        queue_arr.push(next_node) #enqueue
      end
    end
    # nil
  end

  def find_path(end_pos)

    end_node = root_node.bfs(end_pos)
    trace_path_back(end_node)
  end

  def trace_path_back(end_node)

    path = [end_node.value]
    until end_node.value == @root_node.value
      path.unshift(end_node.parent.value)
      end_node = end_node.parent
    end
    path
  end
end

# k = KnightPathFinder.new([4,5])
# p KnightPathFinder.valid_moves([4,5])
# p KnightPathFinder.valid_moves([7,1])
# k.new_move_positions([4,5])
# p k.considered_positions
# k.new_move_positions([5,3])
# p k.considered_positions
# k.build_move_tree
# p k.root_node.children

# p k.find_path([0,3])
kpf = KnightPathFinder.new([0, 0])
p kpf.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
p kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]

# p kpf.root_node.dfs([7,6])