class Answer < ActiveRecord::Base

  belongs_to :question,  inverse_of: :answers
  belongs_to :user,      inverse_of: :answer

end
