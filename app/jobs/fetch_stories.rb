class FetchStories
  @queue = :save_entries

  def self.perform()
    puts 'Fetching stories from Hacker News'
    Story.save_entries_from_hn
  end

end