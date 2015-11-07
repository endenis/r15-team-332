class QuestionsController < ApplicationController

  def show
    question_id = params[:id]
    @question = Question.find(question_id)
    @answers = @question.answers
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.create(question_params)
    redirect_to(@question)
  end

  private

  def question_params
    params[:question].permit(:description)
  end

end
