class QuestionsController < ApplicationController

  def show
    question_id = params[:id]
    @question = Question.find(question_id)
    @answers = Answer.joins(:question).where(questions: {id: question_id})
  end

end