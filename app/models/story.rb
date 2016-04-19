require 'ruby-hackernews'

class Story < ActiveRecord::Base
  include RubyHackernews
  has_many :comments, dependent: :destroy
  validates :external_id, presence: true
  acts_as_votable

  def self.save_entries_from_hn
    entries = RubyHackernews::Entry.all(17).shift(500)
    increment = Story.maximum(:active_group) + 1

    stories = entries.map.with_index do |e,i|
      s = Story.find_or_initialize_by(external_id: e.id, url: e.link.href)
      s.external_id = e.id
      s.title = e.link.title
      s.url = e.link.href
      s.active_group = increment
      s.hn_score = e.voting.score
      s.hn_rank = i
      s.save
      s
    end
    stories.select(&:persisted?)
  end
end
