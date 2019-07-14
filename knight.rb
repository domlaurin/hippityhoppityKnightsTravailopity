require_relative 'polytree.rb'
require 'byebug'

class KnightPathFinder
    def initialize(pos)
        @root_node = PolyTreeNode.new(pos)
        @considered_positions = [@root_node]
        @move_tree = [@root_node]
        self.build_move_tree
    end

    def self.valid_moves(pos)
        adders = [[-1,2],[1,2],[2,1],[-2,1],[-1,-2],[1,-2],[2,-1],[-2,-1]]
        validmoves = []
        adders.each do |adder|

            move = pos.value.zip(adder).map {|a| a.sum}

            if move.all? {|num| num.between?(0,7)}
                validmoves.concat(PolyTreeNode.new(move))
            end
        end
        validmoves
    end 

    def new_move_positions(pos)
        remaining_moves = KnightPathFinder.valid_moves(pos) - @considered_positions
        @considered_positions.concat(remaining_moves)

        remaining_moves
    end

    def build_move_tree
        queue = [@root_node]
        until queue.empty?
            position = queue.shift
            new_nodes = new_move_positions(position).map do |pos| 
                node = PolyTreeNode.new(pos)
                node.children = KnightPathFinder.valid_moves
                node
            end
            @move_tree.concat(new_nodes)
            queue.concat(new_nodes)
        end
        @move_tree
    end  

    def find_path(end_pos)
        array = [@root_node]

        # debugger
        until array.empty?
            node = array.shift
            if node.value == end_pos
                return trace_path_back(node)
            else
                array.concat(node.children)
                # array = array.flatten
            end
        end
        #you will traverse the move tree whenever #find_path is called.
    end

    def trace_path_back(node)
        array = []

        until node.parent == nil
            array.unshift(node.parent)
            node = array[0]
        end
        array
    end
 
end

# kpf = KnightPathFinder.new([0, 0])
# kpf.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
# kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]















# plan:
    #up to 8 possible moves

    #call #self.valid_moves(pos) but filter out any positions already in @considered_positions
    #add remaining new positions to @considered_positions
    #return these new positions
    
    #use new_move_positions(pos)
    # use the bfs idea
    # use a queue to process nodes in FIFO order
    # start with root_node representing the start_pos

    # explore moves from one position at a time
        # next build nodes represting positions one move away, add these to the queue
        # then take the next node from the queue ... until the queue is empty.

    # to help us find paths - build a move tree 
    # values in the tree will be positions
    # Use PolyTreeNode instances to represent each position

    # a node is child of another node if you can move from the parent position directly to the child position.
    # root is knight's' starting position.

    # search for end_pos in the move_tree
    # use either dfs or bfs from the PolyTreeNode exercises, it doensn't' matter
    # this should return the tree node instance containing end_pos

    # create #trace_path_back
    # this should trace back from node to the root using PolyTreeNode#parent
    # as it goes up and up toward the root - it should add the value to an array

    # trace_path_back should return the values in order from the start position to the end position
    # use trace_path_back to finish up find_path
