require 'spec_helper'

class SimplePostPresenter < ActsPresentably::Presenters::DefaultPresenter
  fields :title
end

class AuthorPresenter < ActsPresentably::Presenters::DefaultPresenter
  fields :name
end


class AuthorWithPostsPresenter < ActsPresentably::Presenters::DefaultPresenter
  fields :name
  associations :posts
end



describe "Presentably::Presenters::DefaultPresenter" do

  describe "to_json" do
    before do
      @author = Author.new(:name => 'Joe')
      @post = @author.posts.build(:title => 'Hello', :text => 'First post!')
    end
    it "should use the fields specified in 'fields'" do
      JSON.parse(@post.to_json(:post_presenter => SimplePostPresenter )).should == {"title" => 'Hello'}
    end
    context "author presenter" do
      it "should render the post associations" do
        JSON.parse(@author.to_json(:author_presenter => AuthorPresenter)).should == {"name"=>"Joe"}
      end
    end
    context "author with posts presenter" do
      it "should render the post associations" do
        JSON.parse(@author.to_json(:author_presenter => AuthorWithPostsPresenter, :post_presenter => SimplePostPresenter)).should == {"name"=>"Joe", "posts"=>[{"title"=>"Hello"}]}
      end
    end
  end

end