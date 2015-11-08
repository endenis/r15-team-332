class Question < ActiveRecord::Base

  has_many :answers
  belongs_to :user
  has_one :recording
  # has_one :answer

end
