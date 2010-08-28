require "../src/BinaryTree"
require "../src/BinaryTreeNode"
require "test/unit"

class BinaryTreeTest < Test::Unit::TestCase

	def test_should_be_empty_by_default
		tree = BinaryTree.new
		assert tree.empty?
	end

	def test_add_when_tree_is_empty
		tree = BinaryTree.new
    tree.add 'dog'

    assert_equal 1, tree.size
    assert_equal 'dog', tree.root.value
	end

	def test_add_to_the_left_when_tree_has_only_root
		tree = BinaryTree.new
    tree.add 'a'
    tree.add 'b', :left

    assert_equal 2, tree.size
    assert_equal 'a', tree.root.value
    assert_equal 'b', tree.root.left_child.value
    assert tree.root.right_child.nil?
    assert tree.root.left_child.leaf?
	end

 	def test_add_to_the_right_when_tree_has_only_root
		tree = BinaryTree.new
    tree.add 'a'
    tree.add 'c', :right

    assert_equal 2, tree.size
    assert_equal 'a', tree.root.value
    assert_equal 'c', tree.root.right_child.value
    assert tree.root.left_child.nil?
    assert tree.root.right_child.leaf?
	end

  def test_reset_current_node
    tree = create_abc_tree

    assert_equal 3, tree.size
    assert_equal 'a', tree.root.value
    assert_equal 'b', tree.root.left_child.value
    assert_equal 'c', tree.root.right_child.value
    assert tree.root.left_child.leaf?
    assert tree.root.right_child.leaf?    
  end

  def test_go_left
    tree = create_abc_tree
    tree.reset_current_node
    
    assert tree.current_node.root?

    tree.go_left

    assert tree.current_node.leaf?
    assert_equal 'b', tree.current_node.value
  end

  def test_go_right
    tree = create_abc_tree
    tree.reset_current_node
    
    assert tree.current_node.root?

    tree.go_right

    assert tree.current_node.leaf?
    assert_equal 'c', tree.current_node.value
  end

  def test_go_back_one_level
    tree = create_abc_tree
    tree.add 'd', :left

    assert_equal 'd', tree.current_node.value
    assert_equal 4, tree.size 

    tree.go_back_one_level

    assert_equal 'b', tree.current_node.value
  end

  def test_should_go_back_to_root_when_has_no_parent
    tree = create_abc_tree
    tree.go_back_one_level
    tree.go_back_one_level

    assert_equal tree.root, tree.current_node
  end

  def create_abc_tree
    tree = BinaryTree.new
    tree.add 'a'
    tree.add 'c', :right
      
    tree.reset_current_node
    tree.add 'b', :left

    tree
  end
end
