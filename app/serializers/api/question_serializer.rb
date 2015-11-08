class Api::QuestionSerializer < ActiveModel::Serializer

  attributes :id, :description

  has_one :user, serializer: UserShortSerializer

end