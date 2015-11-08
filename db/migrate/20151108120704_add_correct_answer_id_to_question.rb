class AddCorrectAnswerIdToQuestion < ActiveRecord::Migration
  def change
    add_reference :questions, :correct_answer, references: :answer
  end
end
