require_relative '../../in_class/lib/tree_traversal'

class PhoneNumberSearch
  class << self
    def enumerate_strings(phone_number)
      build_tree(phone_number).depth_first_flat_list
    end

    def build_tree(remaining_numbers, letters_so_far="")
      tree = TreeNode.new(letters_so_far)

      return tree if remaining_numbers.empty?

      tree.children = build_children(remaining_numbers, letters_so_far)

      tree
    end

    def subwords_of(composite, dictionary)
      tree = build_subword_tree(composite, dictionary)

      extract_subword_combos(tree, composite).compact
    end

    def find_word_breakdowns(phone_number, dictionary)
      composites = enumerate_strings(phone_number).select { |composite| composite.length == phone_number.length }

      composites.map { |composite| subwords_of composite, dictionary }.reject { |composite| composite.empty? }.first
    end

    private

    def build_subword_tree(composite, dictionary, tree=nil)
      tree ||= TreeNode.new("root")

      dictionary.each do |word|
        if composite.start_with?(word)
          tree.children << build_subword_tree(composite[word.length..-1], dictionary, TreeNode.new(word))
        end
      end

      tree
    end

    def extract_subword_combos(tree, composite, combos=[])
      tree.children.each do |child|
        combo = combo_for child
        combos << combo if combo.join == composite
      end

      combos
    end

    def combo_for(node, combo_so_far=[])
      combo_so_far << node.value
      return combo_so_far if node.children.empty?

      next_node = find_next_node(node.children)

      combo_for(next_node, combo_so_far)
    end

    def find_next_node(children)
      if children.length == 1
        children.first
      else
        children.find { |n| !n.children.empty? }
      end
    end

    def build_children(remaining_numbers, letters_so_far)
      letters_for(remaining_numbers.first).map do |letter|
        next_string = letters_so_far + letter
        build_tree(remaining_numbers[1..-1], next_string)
      end
    end

    def children_for(number, letters_so_far)
      letters_for(number).map do |letter|
        next_string = letters_so_far + letter
        TreeNode.new(next_string)
      end
    end

    def letters_for(number)
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
end
