class PostsController < ApplicationController
  def index
    @posts = Post.all   
  end

  def show
    @post = Post.find(params[:id])   

  end

  def new
    @post = Post.new   
  end

  def create
    @post = Post.new(post_params)   
    if @post.save   
      flash[:notice] = 'Post added!'   
      redirect_to root_path   
    else   
      flash[:error] = 'Failed to add post!'   
      render :new   
    end   
  end

  def edit
    @post = Post.find(params[:id])   
  end

  def update
    @post = Post.find(params[:id])   
    if @post.update_attributes(post_params)   
      flash[:notice] = 'Post updated!'   
      redirect_to root_path   
    else   
      flash[:error] = 'Failed to edit post!'   
      render :edit   
    end   
  end

  def destroy
    @post = Post.find(params[:id])   
    if @post.delete   
      flash[:notice] = 'Post deleted!'   
      redirect_to root_path   
    else   
      flash[:error] = 'Failed to delete this post!'   
      render :destroy   
    end   
  end


    def post_params   
      params.require(:post).permit(:title, :content)   
    end   


end
