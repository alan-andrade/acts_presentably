require 'spec_helper'

describe "acts_presentably" do
  context "a presentable model" do
    before do
      @post = Post.all.sample
      @author = Author.all.sample
    end
    context "is extended" do
      it "#presentable? returns true" do
        @post.presentable?.should be_true
      end
      it "#presenter_class" do
        @post.presenter_class.should == 'PostPresenter'
      end
      it "#presenter_key" do
        @post.presenter_key.should == :post_presenter
      end
    end
    context "#as_json" do
      it "it uses the default presenter" do
        @post.as_json[:title].should == @post.title
        @post.as_json[:text].should == @post.text
      end
      it "uses the presenter passed in options" do
        @post.as_json(:post_presenter => PostAlternativePresenter)[:text].should == nil
        @post.as_json(:post_presenter => PostAlternativePresenter)[:title].should == @post.title
      end
      it "gives default behavior when no presenter class exists" do
        @author.as_json.should == "null"
      end
    end
  end
end