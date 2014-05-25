class TreeNode
  attr_accessor :value, :children

  def initialize(value)
    self.value = value
    self.children = []
  end

  def depth_first_flat_list(list=[])
    list << value

    children.each do |child|
      child.depth_first_flat_list(list)
    end

    list
  end

  def breadth_first_flat_list(list=[], roots=[self])
    return list if roots.empty?

    list << roots.map(&:value)
    new_roots = roots.map(&:children)

    breadth_first_flat_list(list.flatten, new_roots.flatten)
  end
end
