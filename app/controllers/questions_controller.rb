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
    question = params[:question]
    @question = Question.create(description: question[:description])
    redirect_to(@question)
  end

end
