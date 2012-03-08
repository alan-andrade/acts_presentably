require 'spec_helper'

describe "acts_presentably" do
  context "a presentable model" do
    before do
      @post = Post.all.sample
    end
    it "#presentable? returns true" do
      @post.presentable?.should be_true
    end
    it "#presenter_class" do
      @post.presenter_class.should == 'PostPresenter'
    end
    it "#presenter_key" do
      @post.presenter_key.should == :post_presenter
    end
    it "#as_json" do
      @post.as_json[:title].should == @post.title
      @post.as_json[:text].should == @post.text
    end
  end
end