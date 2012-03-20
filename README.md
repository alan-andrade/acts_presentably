# ActsAsPresentable

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'acts_as_presentable'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install acts_as_presentable

## Usage
To create a presenter for your User class, first create a presenter in app/presenters.
You'll want to override ```fields``` and, optionally, ```include_related_in```

    class PostPresenter < Presentably::Presenters::DefaultPresenter
      fields :title, :text
      association :author
    end


You can even specify a different presentation name for your attribute:
    class PostAlternativePresenter < Presentably::Presenters::DefaultPresenter
      fields {:key => :title, :display_as => :name}, :text
      association :author
    end


Now in your ActiveRecord model add the acts\_presentably line.
    class Post
      acts_presentably
    end

Now you can run...
@post = Post.new(:title => 'First Post', :text => 'Annoying first post')
@post.to_json
@post.to_json(:post_presenter => PostAlternativePresenter )

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
