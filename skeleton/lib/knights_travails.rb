require_relative '00_tree_node.rb'

class KnightPathFinder
    def self.valid_moves(position)
        move_array = []

        all_position_changes = [[1,2],[-1,2],[2,1],[2,-1],[1,-2],[-1,-2],[-2,1],[-2,-1]]
        all_position_changes.each do |position_change|
            new_position = [position_change[0] + position[0], position_change[1] + position[1]]
            if new_position[0] < 7 && new_position[0] >= 0 && new_position[1] < 7 && new_position[1] >= 0
                move_array << new_position
            end
        end
        move_array
    end

    def initialize(position)
        @root_node = PolyTreeNode.new(position)
        @considered_positions = [position]
    end

    def new_move_positions(pos)

    end
end