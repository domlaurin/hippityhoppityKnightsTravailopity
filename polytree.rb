class PolyTreeNode
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(node)
        unless @parent == nil
            @parent.children.delete(self)
        end
        @parent = node
        unless node == nil
            node.children << self
        end
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        raise "error" if child_node.parent == nil
        child_node.parent = nil
    end

    def dfs(target_value)
        return self if self.value == target_value

        self.children.each do |child|
            node = child.dfs(target_value)
            if node == nil
                next
            else
                return node
            end
        end
        nil
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

    def inspect
        @value.inspect
    end

attr_reader :parent, :children, :value
end

  
