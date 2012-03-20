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
The easiest way to setup your presenter is to define its "fields" and any "associations".

    class PostPresenter < Presentably::Presenters::DefaultPresenter
      fields :title, :text
      associations :author
    end


For maximum flexibility simply override ```as_json```. 
@object is the object you're creating the json for, and is available in all methods.

You can even specify a different presentation name for your attribute:

    class AltnerativePostPresenter < Presentably::Presenters::DefaultPresenter
      def as_json(options = {})
        {
          :name => @object.title
        }
      end
        
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
