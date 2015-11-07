class PagesController < ApplicationController

  def index
    @questions= Array.new(15) { |i| "Question number #{i}" }
  end

  def about
  end

end
