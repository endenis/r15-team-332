class Question < ActiveRecord::Base

  has_many :answers,  inverse_of: :question
  belongs_to :user,   inverse_of: :questions
  has_one :recording



end
