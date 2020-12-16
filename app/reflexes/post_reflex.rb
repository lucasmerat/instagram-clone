class PostReflex < ApplicationReflex
  delegate :current_account, to: :connection
  
  def like
    @post_id = element.dataset[:post_id]
    find_post

    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @post.likes.create(account_id: current_account.id)
    end
  end

  private
  def find_post
    @post = Post.find(@post_id)
  end

  def find_like
    @like = @post.likes.find(@post_id) if @post.likes.size 
  end

  def already_liked?
    Like.where(account_id: current_account.id, post_id:
    @post_id).exists?
  end
end