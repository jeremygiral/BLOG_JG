class CommentsController < ApplicationController
  before_action :set_post
  def create
    @comment = @post.comments.build(comment_params)


    if @comment.save
      redirect_to posts_path
    else
      flash[:alert] = "Check the comment form, something went wrong."
      render root_path
    end
  end
  def destroy
    @comment = @post.comments.find(params[:id])

    @comment.destroy
    flash[:success] = "Comment deleted :("
    redirect_to root_path
  end
  private

  def comment_params
    params.require(:comment).permit(:content, :email, :user_name)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
