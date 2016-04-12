class StoriesController < ApplicationController
  def index
    increment = Story.maximum(:active_group)
    @stories = Story.where(active_group: increment)
  end

  def show
    @story = Story.find(params[:id])
  end
end
