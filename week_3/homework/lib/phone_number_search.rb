require_relative '../../in_class/lib/tree_traversal'

class PhoneNumberSearch
  def self.enumerate_strings(phone_number)
  end

  def self.build_tree(remaining_numbers, letters_so_far="", tree=nil)
    return [] if remaining_numbers.empty?

    if tree.nil?
      tree = TreeNode.new(nil)
      tree.children = build_tree(remaining_numbers, letters_so_far, tree)
      tree
    else
      tree.children = children_for(remaining_numbers.first, letters_so_far)

      tree.children.each do |child|
        build_tree(remaining_numbers[1..-1], letters_so_far + child.value, child)
      end
    end
  end

  def self.subwords_of(composite, dictionary)
  end

  def self.find_word_breakdowns(phone_number, dictionary)
  end

  private

  def self.children_for(number, letters_so_far)
    letters_for(number).map do |letter|
      next_string = letters_so_far + letter
      TreeNode.new(next_string)
    end
  end

  def self.letters_for(number)
    {
      '2' => ['a', 'b', 'c'],
      '3' => ['d', 'e', 'f'],
      '4' => ['g', 'h', 'i'],
      '5' => ['j', 'k', 'l'],
      '6' => ['m', 'n', 'o'],
      '7' => ['p', 'q', 'r', 's'],
      '8' => ['t', 'u', 'v'],
      '9' => ['w', 'x', 'y', 'z']
    }[number.to_s]
  end
end
