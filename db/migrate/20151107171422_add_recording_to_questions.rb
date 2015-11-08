class AddRecordingToQuestions < ActiveRecord::Migration

  def change
    add_attachment :questions, :recording
  end

end
