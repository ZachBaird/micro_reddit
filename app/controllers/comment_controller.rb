class CommentController < ApplicationController
  def index
    @comments = Comment.all

    render json: @comments
  end

  def comments_by_post
    @comments = Comment.where(post: params[:postId])

    render json: @comments
  end

  def show
    @comment = Comment.find(params[:id])

    render json: @comment
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      render json: @comment
    else
      render json: { status: 'error', message: 'Failed to create. ' }
    end
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      render json: @comment
    else
      render json: { status: 'error', message: 'Failed to update. ' }
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    render json: { status: 'success', message: 'Successfully deleted comment.' }
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id, :post_id)
  end
end
