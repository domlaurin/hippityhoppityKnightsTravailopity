1. Create KnightPathFinder class
    a. let the initialize method accept a starting pos
    b. set @root_node = starting pos
    c. set @move_tree = "baobab" #should have .length 64
    d. set @considered_positions = [@root_node]
    d. call #build_move_tree

2. make ::valid_moves(pos)
    a. find up to 8 possible moves

3. make #new_move_positions(pos)
    a. call ::valid_moves(pos)
    b. remove any moves that were already in @considered_positions
    c. add remaining new moves to @considered_positions
    d. return new moves


build a move tree
    a. the values will be positions (use PolyTreeNode instances to represent each pos)
    b. set node's' children as its children.
    c. the root node should be the starting pos

 beginning with @root_node, create #build_move_tree

 I will traverse @move_tree whenever I call #find_path

 