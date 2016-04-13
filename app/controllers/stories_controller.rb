class StoriesController < ApplicationController
  def index
    Rails.cache.fetch("hn_data", expires_in: 5.minutes) do
      Story.save_entries_from_hn
    end
    increment = Story.maximum(:active_group)
    @stories = Story.where(active_group: increment)
  end

  def show
    @story = Story.find(params[:id])
    @comment = Comment.new(story: @story)
  end

  def upvote
    @story = Story.find(params[:id])
    @story.upvote_by current_user
    calculate_and_save_points
    redirect_to :back
  end

  def downvote
    @story = Story.find(params[:id])
    @story.downvote_by current_user
    calculate_and_save_points
    redirect_to :back
  end

  private

  def calculate_and_save_points
    upvotes = @story.get_upvotes.size
    downvotes = @story.get_downvotes.size
    @story.points = upvotes - downvotes
    @story.save
  end

end
