## Hacker500
##### Hacker500 is a Rails application that interacts with the HackerNews API. It uses Resque and Redis to fetch the most recent 500 posts in the background. It saves these entries to the Database. Users can then vote and comment on the articles.

### Getting started:
* `gem install redis`
* `bundle`
* `rake db:setup`
* `redis-server`
* `rails s`
* `bundle exec rake environment resque:scheduler`
* `bundle exec rake environment resque:work QUEUE=save_entries`
