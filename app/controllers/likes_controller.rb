class LikesController < ApplicationController
  before_action :find_post
  def create
    @post.likes.create(account_id: current_user.id)
  end

  def destroy
  end

  private
  def find_post
    @post = Post.find(params[:post_id])
  end
end
