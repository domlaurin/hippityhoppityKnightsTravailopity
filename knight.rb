require_relative 'polytree.rb'

class KnightPathFinder
    def initialize(pos)
        @root_node = PolyTreeNode(pos)
        @considered_positions = [pos]
        self.build_move_tree
    end

    def self.valid_moves(pos)
        adders = [[-1,2],[1,2],[2,1],[-2,1],[-1,-2],[1,-2],[2,-1],[-2,-1]]
        validmoves = []
        adders.each do |adder|
            move = pos.zip(adder).map &:sum
            if move.all? &:between?(0,7)
                validmoves << move
            end
        end
    end 

    def new_move_positions(pos)
        remaining_moves = self.valid_moves(pos) - @considered_positions
        @considered_positions.concat(remaining_moves)

        remaining_moves
    end

    def build_move_tree
        
        move_tree = []
        queue = new_move_positions(@root_node)

        until queue.empty?

        end

        #use new_move_positions(pos)
        # use the bfs idea
        # use a queue to process nodes in FIFO order
        # start with root_node representing the start_pos
        explore moves from one position at a time
        next build nodes represting positions one move away, add these to the queue
        then take the next node from the queue ... until the queue is empty.
    end

    to help us find paths - build a move tree 
    values in the tree will be positions
    Use PolyTreeNode instances to represent each position

end





def bfs(target_value)
    array = [self]
    until array.empty?
        node = array.shift
        if node.value == target_value
            return node
        else
            array << node.children
            array = array.flatten
        end
    end
end




plan:
    #up to 8 possible moves

    #call #self.valid_moves(pos) but filter out any positions already in @considered_positions
    #add remaining new positions to @considered_positions
    #return these new positions