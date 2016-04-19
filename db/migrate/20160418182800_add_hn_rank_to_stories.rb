class AddHnRankToStories < ActiveRecord::Migration
  def change
    add_column :stories, :hn_rank, :integer, after: :hn_score
  end
end
