require "src/BinaryTree"
require "src/BinaryTreeNode"
require "src/AnimalGuesser"
require "test/unit"

class AnimalGuesserTest < Test::Unit::TestCase

  def test_start_guessing
    guesser = AnimalGuesser.new
    
    assert_equal 'dog', guesser.start_guessing
  end

  def test_guessed_wrong_animal
    guesser = AnimalGuesser.new
    guesser.start_guessing
    
    msg = guesser.next_question(:no)

    assert_equal 'You win', msg
  end

  def test_guessed_right_animal
    guesser = AnimalGuesser.new
    guesser.start_guessing

    msg = guesser.next_question(:yes)

    assert_equal 'I win', msg
  end

  def test_add_new_animal_and_question
    guesser = AnimalGuesser.new

    msg = guesser.start_guessing
    assert_equal 'dog', msg
    
    msg = guesser.next_question(:no)
    assert_equal 'You win', msg

    guesser.add_animal 'lion', 'is feline?', :yes
    
    msg = guesser.start_guessing
    assert_equal 'is feline?', msg

    msg = guesser.next_question(:yes)
    assert_equal 'lion', msg

    msg = guesser.next_question(:no)
    assert_equal 'You win', msg

    guesser.add_animal 'cat', 'has a mane?', :no

    msg = guesser.start_guessing
    assert_equal 'is feline?', msg
    
    msg = guesser.next_question(:yes)
    assert_equal 'has a mane?', msg

    msg = guesser.next_question(:no)
    assert_equal 'cat', msg

    msg = guesser.next_question(:yes)
    assert_equal 'I win', msg
  end
end
