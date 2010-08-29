class AnimalGuesser

  ANSWER_TO_SIDE = {:yes => :right, :no => :left}

  def initialize
    @question_tree = BinaryTree.new
    @question_tree.add 'dog'
  end

  def start_guessing
    @question_tree.reset_current_node
    @question_tree.current_node.value
  end

  def next_question(answer)
    if @question_tree.current_node.leaf?    
      if answer == :yes
        'I win'
      else
        'You win'
      end
    else
      if answer == :yes
        @question_tree.go_right
      else
        @question_tree.go_left
      end
      @question_tree.current_node.value
    end
  end

  def add_animal(new_animal, new_hint, new_animal_fits_new_hint)
    new_animal_side = ANSWER_TO_SIDE[new_animal_fits_new_hint]
    old_animal_side = new_animal_side == :left ? :right : :left
    @question_tree.add_as_parent new_hint, old_animal_side
    @question_tree.add new_animal, new_animal_side
  end
end
