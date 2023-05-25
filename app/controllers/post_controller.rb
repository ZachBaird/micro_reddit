class PostController < ApplicationController
  def index
    @posts = Post.all

    render json: @posts
  end

  def posts_by_user
    @posts = Post.where(user: params[:userId])

    render json: @posts
  end

  def show
    @post = Post.find(params[:id])

    render json: @post
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      render json: @post
    else
      render json: { status: 'error', message: 'Failed to create. ' }
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      render json: @post
    else
      render json: { status: 'error', message: 'Failed to update. ' }
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    render json: { status: 'success', message: 'Successfully deleted post.' }
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end
end
