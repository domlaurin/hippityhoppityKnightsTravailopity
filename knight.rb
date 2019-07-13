require_relative 'polytree.rb'

class KnightPathFinder
    def initialize(pos)
        @root_node = PolyTreeNode(pos)
        @considered_positions = [pos]
        #self.build_move_tree
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
        #up to 8 possible moves
    end

    def new_move_positions(pos)
        #call #self.valid_moves(pos) but filter out any positions already in @considered_positions
        #add remaining new positions to @considered_positions
        #return these new positions
    end

    # def build_move_tree
    #     #build move tree beginning with self.root_node
    # end

end


