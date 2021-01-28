class Answer < ApplicationRecord

  belongs_to :question

  validates :title, presence: true
  
  validate :count_of_answers, on: :create

  scope :right_answers, -> { where(correct: true) }

  def count_of_answers
    if question.answers.count >= 4
      errors.add(:question, 'Question mast have less than 4 answers')
    end
  end

end
