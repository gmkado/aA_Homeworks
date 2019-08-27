class PolyTreeNode
    def initialize(value)
        self.value = value
        self.parent = nil
        self.children = []
    end

    attr_accessor :value, :children
    attr_reader :parent

    def parent= (parent_node)
        if parent
            parent.children.delete(self)
        end

        @parent = parent_node
        if parent_node
            parent_node.children << self            
        end
    end

    def add_child(child_node)
        children << child_node if children.index(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        child_node.parent = nil
        
        if children.delete(child_node).nil?
            raise error
        end
    end

    def dfs(search_value)
        # print value
        if value == search_value
            return self
        end        

        children.each do |child_node|
            node = child_node.dfs(search_value)
            return node if node
        end

        nil
    end

    def bfs(search_value)
        queue = [self]

        until queue.empty?
            node = queue.shift
            return node if node.value == search_value
            
            queue += node.children
        end
    end
end