class LinkedList
  class Node
    attr_accessor :value, :next_node

    def initialize(value, next_node = nil)
      @value = value
      @next_node = next_node
    end
  end

  attr_accessor :head

  def append(value)
    if head.nil?
      prepend value
    else
      walk_list do |node|
        if last_node?(node)
          node.next_node = Node.new(value)
          return
        end
      end
    end
  end

  def get(index)
    walk_list do |node|
      return node.value if index == 0
      index -= 1
    end
  end

  def prepend(value)
    self.head = Node.new(value, head)
  end

  def length
    values.length
  end

  def values
    values = []
    walk_list { |node| values << node.value }
    values
  end

  def insert_before(index, value)
    raise Exception, "Out Of Bounds" if index > length or index < 0

    if index == 0
      prepend value
    else
      walk_list do |node|
        if index == 1
          node.next_node = Node.new(value, node.next_node)
        end
        index -= 1
      end
    end
  end

  private

  def walk_list
    list = self.dup

    until list.head.nil?
      yield(list.head)
      list.head = list.head.next_node
    end
  end

  def last_node?(node)
    node.next_node.nil?
  end

  def delete(index)
  end
end
