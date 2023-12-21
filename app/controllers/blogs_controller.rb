class BlogsController < ApplicationController

  def new
    @blog = Blog.new
  end

  def index
    @blogs = Blog.all
  end

  def show 
    @blog = Blog.includes(:comments).find(params[:id])
    @comment = Comment.new 
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    if @blog.save 
      redirect_to my_blogs_path, notice: 'Blog created!'
    else
      render :new 
    end 
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to my_blogs_path, notice: 'Blog Updated!'
    else 
      render :edit
    end 
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy 
    redirect_to my_blogs_path, notice: 'Blog Deleted!'
  end

  def my_blogs
    if user_signed_in?
      @blogs = current_user.blogs
    else
      redirect_to root_path, alert: 'Please sign in to view your blogs.'
    end
  end

  def all_blogs
    @blogs = Blog.all 
  end

  private

  def set_blog 
    @blog = Blog.find(params[:id])
  end

  private 

  def blog_params
    params.require(:blog).permit(:title, :body)
  end
end