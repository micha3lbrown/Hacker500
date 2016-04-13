require 'ruby-hackernews'

class Story < ActiveRecord::Base
  include RubyHackernews

  validates :external_id, presence: true
  acts_as_votable

  def self.save_entries_from_hn
    entries = RubyHackernews::Entry.all(17).drop(10)
    increment = Story.maximum(:active_group) + 1

    stories = entries.map do |e|
      s = Story.find_or_initialize_by(external_id: e.id, url: e.link.href)
      s.external_id = e.id
      s.title = e.link.title
      s.url = e.link.href
      s.active_group = increment
      s.hn_score = e.voting.score
      s.save
      s
    end
    stories.select(&:persisted?)
  end
end
