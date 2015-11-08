class RemoveRecordingIdFromQuestions < ActiveRecord::Migration
  def change
    remove_reference :questions, :recording
  end
end
