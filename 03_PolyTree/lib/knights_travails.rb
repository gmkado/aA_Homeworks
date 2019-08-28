require_relative '00_tree_node'

class KnightPathFinder
    attr_accessor :root_node,:considered_move_positions
    def initialize(starting_position)
        self.root_node = PolyTreeNode.new(starting_position)
        self.considered_move_positions = [starting_position]
        build_move_tree
    end

    def build_move_tree
        queue = [root_node]

        until queue.empty?
            node = queue.shift
            children = new_move_positions(node.value).map!{|position| PolyTreeNode.new(position)}
            children.each{|child|node.add_child(child)}

            queue += children
        end
    end

    def find_path(end_pos)
        end_node = root_node.dfs(end_pos)
        trace_path_back(end_node)
    end

    def trace_path_back(end_node)
        path = [end_node.value]
        node = end_node
        while node.parent
            node = node.parent
            path.unshift(node.value)
        end

        path
    end

    def self.valid_move_positions (pos)
        # program l-shaped moves
        moves = [-1, -2, 1, 2]
        possible_moves = moves.permutation(2).select{|ele| ele[0].abs != ele[1].abs}
        possible_moves.map do |move| 
            move[0] += pos[0]
            move[1] += pos[1]
        end

        possible_moves.select{|move| move[0].between?(0, 7) && move[1].between?(0,7)}
    end


    def new_move_positions(pos)
        valid_moves = self.class.valid_move_positions(pos)

        new_moves = valid_moves.select{|new_pos| !considered_move_positions.include?(new_pos)}
        self.considered_move_positions += new_moves

        new_moves
    end
end




if $PROGRAM_NAME == __FILE__
    kpf = KnightPathFinder.new([0, 0])
    # p KnightPathFinder.valid_moves([1,1])
    # p kpf.new_move_positions([0,0]) 
    # p kpf.new_move_positions([0,0])
    
    p kpf.find_path([2, 1]) # => [[0, 0], [2, 1]]
    p kpf.find_path([3, 3]) # => [[0, 0], [2, 1], [3, 3]]
    p kpf.find_path([7, 6])
    p kpf.find_path([6, 2])
end