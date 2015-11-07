class QuestionsController < ApplicationController

  def show
    question_id = params[:id]
    @question = retrieve_question question_id
    @answers = @question.answers
    @anser = Answer.new
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.create(question_params)
    redirect_to(@question)
  end

  def retrieve_question id
    Question.find(id)
  end

  private

  def question_params
    params.require(:question).permit(:description)
  end

end
