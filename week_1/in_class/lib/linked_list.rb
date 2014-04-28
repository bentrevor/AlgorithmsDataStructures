class LinkedList
  class Node
    attr_accessor :value, :next_node

    def initialize(value, next_node = nil)
      @value = value
      @next_node = next_node
    end
  end

  attr_accessor :head, :values

  def initialize
    @values = []
  end

  def length
    values.length
  end

  def head
    values.first
  end

  def append(value)
    if head.nil?
      prepend value
    else
      new_node = Node.new(value)
      values.last.next_node = new_node
      values << new_node
    end
  end

  def get(index)
    values[index].value
  end

  def prepend(value)
    original_values = values
    values.unshift Node.new(value, original_values.first)
  end

  def insert_before(index, value)
    raise Exception, "Out Of Bounds" unless (0..length - 1).include? index

    new_node = Node.new(value, values[index])
    values[index - 1].next_node = new_node
    values.insert index, new_node
  end
end
