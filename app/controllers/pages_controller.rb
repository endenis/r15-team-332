class PagesController < ApplicationController

  def index
    @user = current_or_guest_user
  end

  def about
  end

end
