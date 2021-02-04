class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, optional: true , class_name: "Question"

  before_validation :before_validation_set_first_question, on: :create
  before_update :before_update_next_question
  
  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end
    save!
  end

  def completed?
    current_question.nil?
  end

  def percent_of_success
    correct_questions.to_f/self.test.questions.size
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def before_update_next_question
    self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first
  end

end
