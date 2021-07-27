require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_accessor :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end
  # x o x
  # o x o
  # o x

  def losing_node?(evaluator)
    if board.over?
      return board.winner != evaluator && board.won? # nil != evaluator = true
    end


    all_moves = children
    if next_mover_mark == evaluator
      all_moves.all? { |move| move.losing_node?(evaluator) }
    else
      all_moves.any? { |move| move.losing_node?(evaluator) }
    end
  end

  def winning_node?(evaluator)
    if board.over?
      return board.winner == evaluator && board.won?
    end
    all_moves = children

    if next_mover_mark == evaluator
      all_moves.any? { |move| move.winning_node?(evaluator) }
    else
      all_moves.all? { |move| move.winning_node?(evaluator) }
    end
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    all_moves = []

    (0...3).each do |row|
      (0...3).each do |col|
        pos = [row, col]

        if self.board.empty?(pos)
          copy = self.board.dup
          copy[pos] = next_mover_mark
          prev_move_pos = pos
          if next_mover_mark == :x
            next_mover_mark = :o
          else
            next_mover_mark = :x
          end
          all_moves << TicTacToeNode.new(copy, next_mover_mark, prev_move_pos)

        end
      end
    end
    all_moves
  end


end

b = Board.new
t = TicTacToeNode.new(b, :o, :x)
t.losing_node?(:o)