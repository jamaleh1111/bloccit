require 'rails_helper'

describe User do 

  include TestFactories

  describe "#favorited(post)" do

    before do
      @post = associated_post
      @user = authenticated_user
      #@other_user = authenticated_user
    end 

    it "returns `nil` if the user has not favorited the post" do 
      expect(@user.favorited(@post)).to be_nil
    end 

    it "returns the appropriate favorite if it exits" do
      favorite = @user.favorites.create(post: @post)
      expect(@user.favorited(@post)).to eq(favorite)
    end
  end

end 