class MergeSort
  def self.merge(left, right)
    left_length = left.length
    right_length = right.length
    left_index = right_index = merged_index = 0

    merged = ScoringArray.new(left_length + right_length)

    until left_index == left_length and right_index == right_length
      left_val = left.get(left_index)
      right_val = right.get(right_index)

      if right_index == right_length or (left_index != left_length and left_val < right_val)
        merged.set(merged_index, left_val)
        left_index += 1
      else
        merged.set(merged_index, right_val)
        right_index += 1
      end

      merged_index += 1
    end

    merged
  end

  def self.sort(to_sort)
    to_sort_length = to_sort.length
    return to_sort if to_sort_length == 1

    midpoint = (to_sort_length / 2) - 1
    left = to_sort.slice(0, midpoint)
    right = to_sort.slice(midpoint + 1, to_sort_length)

    merge(sort(left), sort(right))
  end
end
