class AddQuestionToRecordings < ActiveRecord::Migration

  def change
    add_reference :recordings, :question, index: true
  end

end
