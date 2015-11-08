class Question < ActiveRecord::Base

  has_many :answers
  belongs_to :user
  has_one :recording
  # has_one :answer

  def audio_url
    recording.audio.url if recording && recording.audio
  end

end
