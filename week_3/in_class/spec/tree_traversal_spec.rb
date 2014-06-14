require 'tree_traversal'
require 'rspec'
require 'pry'

describe TreeNode do
  it "flattens a tree in a depth first fashion" do
    root = TreeNode.new(42)
        root.children << TreeNode.new(2)
            root.children[0].children << TreeNode.new(99)
            root.children[0].children << TreeNode.new(76)
        root.children << TreeNode.new(8)
            root.children[1].children << TreeNode.new(0)
            root.children[1].children << TreeNode.new(7)

    expect(root.depth_first_flat_list).to eq([42, 2, 99, 76, 8, 0, 7])
  end

  it "flattens a tree in a breadth first fashion" do
    root = TreeNode.new(42)
        root.children << TreeNode.new(2)
            root.children[0].children << TreeNode.new(99)
            root.children[0].children << TreeNode.new(76)
                root.children[0].children[1].children << TreeNode.new(999)
        root.children << TreeNode.new(8)
            root.children[1].children << TreeNode.new(0)
            root.children[1].children << TreeNode.new(7)

    expect(root.breadth_first_flat_list).to eq([42, 2, 8, 99, 76, 0, 7, 999])
  end

  it 'builds a string to print the tree values' do
    root = TreeNode.new(42)
        root.children << TreeNode.new(2)
            root.children[0].children << TreeNode.new(99)
            root.children[0].children << TreeNode.new(76)
                root.children[0].children[1].children << TreeNode.new(999)
        root.children << TreeNode.new(8)
            root.children[1].children << TreeNode.new(0)
            root.children[1].children << TreeNode.new(7)

    printed_tree = root.printable

    printed_tree.should include "42\n"
    printed_tree.should include "  2\n"
    printed_tree.should include "    99\n"
    printed_tree.should include "    76\n"
    printed_tree.should include "      999\n"
    printed_tree.should include "  8\n"
    printed_tree.should include "    0\n"
    printed_tree.should include "    7\n"
  end
end
