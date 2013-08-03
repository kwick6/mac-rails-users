class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment])
    redirect_to post_path(@post)
  end

  def edit 
    @comment = Comment.find params[:id]
  end

  def update 
    @comment = Comment.find params[:id]
    if @comment.update_attributes params[:comment]
      redirect_to comments_path
    else
      render :action => :edit
    end
  end

  def destroy
    @comment = Comment.find params[:id]
    @comment.destroy
    redirect_to comments_path
  end

end
