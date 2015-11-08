class Api::QuestionSerializer < ActiveModel::Serializer

  attributes :id, :description

  has_one :user, serializer: Api::UserShortSerializer

end
