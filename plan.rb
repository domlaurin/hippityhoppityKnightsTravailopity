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
