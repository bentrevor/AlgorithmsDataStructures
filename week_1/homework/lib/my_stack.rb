# Use a linked list to implement
# a Stack.

require_relative '../../in_class/lib/linked_list'

class MyStack
  def initialize
    self.linked_list = LinkedList.new
  end

  def push(element)
    linked_list.prepend element
  end

  def pop
    if linked_list.head
      value = linked_list.head.value
      linked_list.head = linked_list.head.next_node
      value
    end
  end

  private
  attr_accessor :linked_list
end
