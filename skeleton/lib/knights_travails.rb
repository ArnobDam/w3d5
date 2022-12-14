require_relative '00_tree_node.rb'

class KnightPathFinder


    def self.valid_moves(position)
        move_array = []

        all_position_changes = [[1,2],[-1,2],[2,1],[2,-1],[1,-2],[-1,-2],[-2,1],[-2,-1]]
        all_position_changes.each do |position_change|
            new_position = [position_change[0] + position[0], position_change[1] + position[1]]
            if new_position[0] < 8 && new_position[0] >= 0 && new_position[1] < 8 && new_position[1] >= 0
                move_array << new_position
            end
        end
        move_array
    end

    attr_reader :considered_positions

    def initialize(position)
        @root_node = PolyTreeNode.new(position)
        @considered_positions = [position]
    end

    def new_move_positions(pos)
        valid_positions = KnightPathFinder.valid_moves(pos)
        new_positions = []

        valid_positions.each do |position|
            if !@considered_positions.include?(position)
                @considered_positions << position
                new_positions << position
            end
        end
        new_positions
    end

    def build_move_tree
        move_queue = []
        move_queue << @root_node
        # tree = [@root_node.value]

        until move_queue.empty?
            shifted_node = move_queue.shift
            move_positions = new_move_positions(shifted_node.value)
            move_positions.each do |pos|
                node = PolyTreeNode.new(pos)
                node.parent = shifted_node
                move_queue << node
                # tree << node.value
            end
        end
        # tree
        @root_node
    end

    
end

k = KnightPathFinder.new([2,2])
# p k.new_move_positions([0,0])

tree = k.build_move_tree
p k.considered_positions.length
p tree
# puts
# p k.build_move_tree[1]


