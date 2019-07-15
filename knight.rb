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

            new_move = pos.value.zip(adder).map {|a| a.sum}
            
            if new_move.all? {|num| num.between?(0,7)}
                validmoves << new_move
            end
        end

        validmoves
    end 

    def new_move_positions(pos)
        remaining_moves = KnightPathFinder.valid_moves(pos) - @considered_positions.map(&:value)

        positions_mapped_to_nodes = remaining_moves.map {|move| PolyTreeNode.new(move) }

        @considered_positions.concat(positions_mapped_to_nodes)

        positions_mapped_to_nodes
    end

    def build_move_tree
        queue = [@root_node]
        until queue.empty?
            position = queue.shift
            new_nodes = new_move_positions(position)
            new_nodes.each {|node| node.parent = position}
            @move_tree.concat(new_nodes)
            queue.concat(new_nodes)
        end
    end  

    def find_path(end_pos)
        array = [@root_node]

        until array.empty?
            node = array.shift
            if node.value == end_pos
                return trace_path_back(node) << end_pos
            else
                array.concat(node.children)
            end
        end
    end

    def trace_path_back(node)
        array = []

        until node.parent == nil
            array.unshift(node.parent)
            node = array[0]
        end
        array.map {|node| node.value}
    end
 
    attr_reader :move_tree
end

kpf = KnightPathFinder.new([0, 0])
p kpf.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
p kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]
