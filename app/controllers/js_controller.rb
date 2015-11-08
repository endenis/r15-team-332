class JsController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def recorderWorker
    redirect_to_js_asset 'recorderWorker'
  end

  def mp3Worker
    redirect_to_js_asset 'mp3Worker'
  end

  private

  def redirect_to_js_asset asset_name
    respond_to do |format|
      format.js do
        redirect_to ActionController::Base.helpers.asset_path("#{ asset_name }.js")
      end
    end
  end

end
