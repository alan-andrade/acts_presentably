require 'spec_helper'

describe "acts_presentably" do
  context "a presentable model" do
    it "#presentable? returns true" do
      Post.all.sample.presentable?.should be_true
    end
    it "#presenter_class" do
      Post.all.sample.presenter_class.should == 'PostPresenter'
    end
    it "#presenter_key" do
      Post.all.sample.presenter_key.should == :post_presenter
    end
  end
end