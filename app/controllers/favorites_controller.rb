class FavoritesController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: post)
    authorize @favorite

    if favorite.save
      flash[:notice] = "Favorite saved."
      redirect_to [post.topic, post]
    else
      flash[:error] = "There was an error saving the favorite. Please try again."
      redirect_to [post.topic, post]
    end 
  end 

  def destroy
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.find(params[:id]) # Find the current user's favorite with the ID in the params
    authorize @favorite
    
    if favorite.destroy
      flash[:notice] = "Favorite deleted!"
      redirect_to [post.topic, post]
    else
      flash[:error] = "There was an error deleting your favorite. Please try again."
      redirect_to [post.topic, post]
    end 
  end 
end
