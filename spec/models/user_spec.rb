require 'rails_helper'

describe User do 

  include TestFactories

  describe "#favorited(post)" do

    before do
      @post = associated_post
      @user = authenticated_user(email_favorites: true)
      @other_user = authenticated_user
    end 

    it "returns `nil` if the user has not favorited the post" do 
    end 

    it "returns the appropriate favorite if it exits" do
    end 

    it "returns `nil` if the user has favorited another post" do
    end 
end 