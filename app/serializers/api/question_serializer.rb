class Api::QuestionSerializer < ActiveModel::Serializer

  # Will need to add information about the user
  attributes :id, :description

end