class PostsController < ApplicationController
  # before_action :authenticate_user!


  def index
    @posts = Post.all.order('created_at DESC').page params[:page]
  end

  def new
    @post = Post.new
  end


  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      flash[:success] = "Your post has been created!"
      redirect_to posts_path
    else
      flash[:alert] = "Your new post couldn't be created!  Please check the form."
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :category_id).merge(user_id: current_user.id)
    # redirect_to posts_path
  end
  def set_post
    @post = Post.find(params[:id])
  end
end
