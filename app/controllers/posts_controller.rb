class PostsController < ApplicationController
  def index
    @posts = Post.all 
  end
  def new
    @post = Post.new
  end
  def create
    @post=Post.create(post_params)
    if @post.save
      flash[:success] = "Your post has been created"
      redirect_to @post
    else
      flash[:alert] = "Halt, you fiend! You need an image to post here!"
      render :new
    end
  end
  def show
    @post = Post.find(params[:id])
  end
  def edit
    @post = Post.find(params[:id])
    flash[:success] = "Oh god, you weren't meant to see this picture!"
  end
  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    if @post.save
      flash[:success] = "Post updated hombre"
      redirect_to(post_path(@post))
    end
  end
  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end
end
