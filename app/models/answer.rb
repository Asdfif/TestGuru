class Answer < ApplicationRecord

  belongs_to :question

  validates :title, presence: true
  validates_each :question do |record, attr, question|
    record.errors.add(attr, 'Question mast have less than 4 answers') if 
      question.answers.size >= 4
  end

  scope :right_answers, -> { where(correct: true) }

end
