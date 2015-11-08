class Api::QuestionsController < ApplicationController

  # https://github.com/plataformatec/devise/issues/2432#issuecomment-18973236
  # skip_before_filter :verify_authenticity_token, :only => :create

  def index
    @questions = Question.order created_at: :desc
    paginate json: @questions, per_page: 10
  end

  def create
    question = Question.create(question_params)
    question.user_id = current_or_guest_user.id
    render json: question
  end

  def update

  end

  private

  def question_params
    params.permit(:description).merge(user: current_or_guest_user, recording: Record.find(recording_id))
  end

end