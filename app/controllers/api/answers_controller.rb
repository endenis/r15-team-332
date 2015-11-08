class Api::AnswersController < ApplicationController

  def index
    question_id = params[:question_id]
    render json: Question.find(question_id).answers, except: [:question_id]
  end

end