class TreeNode
  attr_accessor :value, :children

  def initialize(value)
    self.value = value
    self.children = []
  end

  def depth_first_flat_list(list=[], depth=0)
    add_to_flat_list = Proc.new { |acc, _| acc << value }

    depth_first_traversal(list, add_to_flat_list, :depth_first_flat_list, 0)
  end

  def breadth_first_flat_list(list=[], roots=[self])
    return list if roots.empty?

    list << roots.map(&:value)
    new_roots = roots.map(&:children)

    breadth_first_flat_list(list.flatten, new_roots.flatten)
  end

  def printable(printed_tree="\n\n", depth=0)
    add_next_level = Proc.new do |acc, depth|
      indentation = "  " * depth
      next_level = indentation + "#{value}\n"

      acc << next_level
    end

    depth_first_traversal(printed_tree, add_next_level, :printable, depth + 1)
  end

  private

  def depth_first_traversal(accumulator, add_to_accumulator, iterating_function, depth)
    add_to_accumulator.call(accumulator, depth)

    children.each do |child|
      child.send iterating_function, accumulator, depth
    end

    accumulator
  end
end
