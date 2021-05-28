class PolyTreeNode

    def initialize(value)
        @parent = nil
        @children = []
        @value = value
    end


    def inspect
        "children = #{children} value = #{value}"
    end
    def parent=(new_parent)
        @parent.children.delete(self) if self.parent != nil
        @parent = new_parent
        new_parent.children << self if new_parent != nil
    end

    def add_child(child_node)
        child_node.parent=(self)
    end

    def remove_child(child_node)
        if child_node.parent != nil
            child_node.parent=(nil)
        else
            raise 'error'
        end
    end

    def dfs(target)
        return self if value == target

        children.each do |children_node|
            current_node = children_node.dfs(target)
            return current_node unless current_node == nil
        end
        nil
    end

    def bfs(target)
        new_arr = [self]
 
        until new_arr.empty?
            return new_arr[-1] if new_arr[-1].value == target

            new_arr[-1].children.each { |child| new_arr.unshift(child)}
            new_arr.pop
        end
        nil
    end
    attr_reader :parent,:children,:value
end