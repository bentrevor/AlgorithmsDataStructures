class BubbleSort
  attr_accessor :list

  def initialize(list)
    self.list           = list
    self.loop_index     = 0
    self.max_loop_index = list.length - 1
  end

  def tick
    return if list.length == 1

    compare_and_swap
    update_indexes
  end

  def sort
    self.tick until list_is_sorted?
  end

  private

  def compare_and_swap
    swap if list[loop_index] > list[loop_index + 1]
  end

  def swap
    tmp = list[loop_index]
    list[loop_index] = list[loop_index + 1]
    list[loop_index + 1] = tmp
  end

  def next_iteration?
    @loop_index == @max_loop_index
  end

  def update_indexes
    @loop_index += 1
    reset_indexes if next_iteration?
  end

  def reset_indexes
    @loop_index = 0
    @max_loop_index -= 1
  end

  def list_is_sorted?
    @max_loop_index == 0
  end

  attr_accessor :loop_index, :max_loop_index
end
