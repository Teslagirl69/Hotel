class PagesController < ApplicationController
  def index
    @rooms = Room.all.first(3)
  end
end
