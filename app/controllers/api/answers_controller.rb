class Api::AnswersController < ApplicationController

  def index
    question_id = params[:question_id]
    @answers = Question.find(question_id).answers
    paginate json: @answers, per_page: 10
  end

end