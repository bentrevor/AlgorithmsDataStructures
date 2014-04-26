# Implement a list that sorts itself
# when inserting a new element

require_relative '../../in_class/lib/linked_list'

class SortedLinkedList < LinkedList
  def insert(value)
    index = 0
    i = 0
    walk_list do |node|
      if node.value > value
        index = i
        break
      end
      i += 1
    end

    insert_before(index, value)
  end
end
