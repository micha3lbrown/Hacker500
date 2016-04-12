require 'ruby-hackernews'

class PagesController < ApplicationController
  include RubyHackernews

  def home
    byebug
    Entry.all
  end

end
