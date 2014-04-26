# Implement the reverse function
# for a linked list

require_relative '../../in_class/lib/linked_list'

class ReversableLinkedList < LinkedList
  def reverse
    vals = self.values
    self.head = nil

    vals.each do |val|
      self.prepend val
    end
  end
end
