class RecordingsController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def create
    print 'recording_params: '
    puts recording_params.keys
    recording = Recording.create! recording_params
    render json: {audio_id: recording.id}
  end

  private

  def recording_params
    params.permit(:audio)
  end

end
