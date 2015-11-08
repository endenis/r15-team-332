class AddRecordingIdToQuestions < ActiveRecord::Migration
  def change
    remove_attachment :questions, :recording
    add_reference :questions, :recording, index: true
  end
end
