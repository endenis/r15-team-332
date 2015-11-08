class Api::AnswerSerializer < ActiveModel::Serializer

  # Will need to add information about the user
  attributes :id, :body, :title, :created_at, :updated_at

  has_one :user, serializer: UserShortSerializer

end