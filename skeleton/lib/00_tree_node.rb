class PolyTreeNode
    attr_reader(:parent, :children, :value)
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(parent_node)
        if @parent != nil
            @parent.children.delete(self)
        end

        @parent = parent_node
        @parent.children << self unless @parent == nil
    end

    def add_child(child_node)
        child_node.parent=self
    end

    def remove_child(child_node)

    end
end

