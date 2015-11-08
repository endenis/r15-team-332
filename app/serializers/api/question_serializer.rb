class Api::QuestionSerializer < ActiveModel::Serializer

  attributes :id, :description, :audio_url, :created_at

  has_one :user, serializer: Api::UserShortSerializer

  def audio_url
    if object.recording && object.recording.audio && object.recording.audio.url
      object.recording.audio.url
    end
  end

  def created_at
    ActionController::Base.helpers.time_ago_in_words object.created_at
  end

end
