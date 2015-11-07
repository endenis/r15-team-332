class Answer < ActiveRecord::Base

  belongs_to: :question,  inverse_of: :answer
  belongs_to: :user,      inverse_of: :answer


end
