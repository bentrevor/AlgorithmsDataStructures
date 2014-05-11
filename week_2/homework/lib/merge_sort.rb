class MergeSort
  def self.merge(left, right)
    merged = ScoringArray.new(left.length + right.length)
    left_index = right_index = merged_index = 0

    until left_index == left.length and right_index == right.length

      if right_index == right.length or (left_index != left.length and left.get(left_index) < right.get(right_index))
        merged.set(merged_index, left.get(left_index))
        left_index += 1
      else
        merged.set(merged_index, right.get(right_index))
        right_index += 1
      end

      merged_index += 1
    end

    merged
  end

  def self.sort(to_sort)
    return to_sort if to_sort.length == 1

    midpoint = (to_sort.length / 2) - 1
    left = to_sort.slice(0, midpoint)
    right = to_sort.slice(midpoint + 1, to_sort.length)

    merge(sort(left), sort(right))
  end
end
