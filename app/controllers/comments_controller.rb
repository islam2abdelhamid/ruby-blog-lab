class CommentsController < ApplicationController
  def create
    @comment = Comment.new(post_params)   
    @comment.user_id = 1
    @comment.post_id = params[:post_id]
    if @comment.save   
      flash[:notice] = 'comment added!'   
      redirect_back fallback_location: root_path
    else   
      flash[:error] = 'Failed to add comment!'   
      redirect_back fallback_location: root_path
    end   
  end

  def destroy
    @comment = Comment.find(params[:comment_id])   
    if @comment.delete   
      flash[:notice] = 'Comment deleted!'   
      redirect_back fallback_location: root_path
    else   
      flash[:error] = 'Failed to delete this comment!'   
      redirect_back fallback_location: root_path
    end   
  end

  def post_params   
    params.require(:comment).permit(:content,:post_id)   
  end   


end
