class PostReflex < ApplicationReflex
  delegate :current_account, to: :connection
  
  def like
    @post_id = element.dataset[:post_id].to_i
    find_post

    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @post.likes.create(account_id: current_account.id)
    end
  end

  def unlike
    @post_id = element.dataset[:post_id].to_i
    find_post
    find_like

    if !(already_liked?)
      flash[:notice] = "Cannot unlike"
    else
      @like.destroy
    end
  end

  def comment
    @post_id = element.dataset[:post_id].to_i
    find_post
    text = params[:post][:text]

    @post.comments.create(text: text, account_id: current_account.id)
  end

  private
  def find_post
    @post = Post.find(@post_id)
  end

  def find_like
    @like = @post.likes.find_by(post_id: @post_id)
  end

  def already_liked?
    Like.where(account_id: current_account.id, post_id:
    @post_id).exists?
  end

  def account_params
    params.require(:post).permit(:text)
  end
end