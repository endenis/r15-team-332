class Api::AnswerSerializer < ActiveModel::Serializer

  # Will need to add information about the user
  attributes :id, :body, :title, :created_at, :updated_at

  has_one :user, serializer: UserShortSerializer

  def created_at
    ActionController::Base.helpers.time_ago_in_words object.created_at
  end
end